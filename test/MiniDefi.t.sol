// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/SimpleToken.sol";
import "../src/TokenVault.sol";

/// @notice MiniDeFi test 
contract MiniDeFiTest is Test {
    SimpleToken token;
    TokenVault vault;

    address deployer;
    address sam = address(0xA1);
    address dav = address(0xB0);

    // common amounts (with 18 decimals)
    uint256 constant ONE_THOUSAND = 1_000 * 1e18;
    uint256 constant ONE_HUNDRED  = 100 * 1e18;

    function setUp() public {
        // test contract is the deployer/owner (address(this))
        deployer = address(this);

        // Deploy token and vault
        token = new SimpleToken();                 // SimpleToken minted to deployer
        vault = new TokenVault(address(token));    // TokenVault uses the token
    
    // Fund the vault with reward tokens
    token.transfer(address(vault), 100_000 * 1e18);

        // send tokens to test users for staking and transfers
        token.transfer(sam, ONE_THOUSAND);
        token.transfer(dav, ONE_THOUSAND);

        // users must approve the vault before staking
        vm.startPrank(sam);
        token.approve(address(vault), type(uint256).max);
        vm.stopPrank();

        vm.startPrank(dav);
        token.approve(address(vault), type(uint256).max);
        vm.stopPrank();
    }

    /* ============================
       1) Token minting & transfers
       ============================ */

    function testTokenInitialSupplyAndTransfer() public {
        // Setup (deployer had initial supply minus transferred amounts)
        uint256 expectedDeployer = 1_000_000 * 1e18 - (100_000 * 1e18 + ONE_THOUSAND + ONE_THOUSAND);
        assertEq(token.balanceOf(deployer), expectedDeployer);

        // Action: transfer from deployer to sam
        token.transfer(sam, ONE_HUNDRED);

        // Assert: balances updated
        assertEq(token.balanceOf(sam), ONE_THOUSAND + ONE_HUNDRED);
        assertEq(token.balanceOf(deployer), expectedDeployer - ONE_HUNDRED);
    }

    function testOnlyOwnerCanMint() public {
        // Setup: deployer is owner
        // Action: owner mints more tokens to dav
        token.mint(dav, ONE_HUNDRED);
        // Assert
        assertEq(token.balanceOf(dav), ONE_THOUSAND + ONE_HUNDRED);

        // Action: non-owner tries to mint -> expect revert
        vm.prank(sam);
        vm.expectRevert(); // no specific revert message assumed
        token.mint(sam, 1e18);
    }

    /* ============================
       2) Staking & Unstaking
       ============================ */

    function testStakingAndUnstakingFlow() public {
        // Setup: sam has tokens and approved vault in setUp

        // Action: sam stakes 100 tokens
        vm.startPrank(sam);
        vault.stake(ONE_HUNDRED);

        // Assert: stake recorded and token balance reduced
        assertEq(vault.getUserStake(sam), ONE_HUNDRED);
        assertEq(token.balanceOf(sam), ONE_THOUSAND - ONE_HUNDRED);

        // Action: sam unstakes 40 tokens
        vault.unstake(40 * 1e18);

        // Assert: stake decreased and token refunded
        assertEq(vault.getUserStake(sam), 60 * 1e18);
        assertEq(token.balanceOf(sam), ONE_THOUSAND - ONE_HUNDRED + 40 * 1e18);

        vm.stopPrank();
    }

    /* ============================
       3) Reward calculations
       ============================ */

    function testRewardAccrualAndClaim() public {
        // Setup: sam stakes 100
        vm.startPrank(sam);
        vault.stake(ONE_HUNDRED);

        // Action: advance in blocks
        uint256 blocksToAdvance = 5;
        vm.roll(block.number + blocksToAdvance);

        // Action: sam claims rewards
        vault.claimRewards();

        // Assert: sam balance includes rewards
        uint256 expectedReward = blocksToAdvance * vault.REWARD_RATE();
        uint256 expectedBalance = ONE_THOUSAND - ONE_HUNDRED + expectedReward;
        assertEq(token.balanceOf(sam), expectedBalance);

        vm.stopPrank();
    }

    function testRewardsDoNotDoubleCountOnStakeChange() public {
        // Stake then change stake, ensure previously earned rewards are preserved
        vm.startPrank(sam);
        vault.stake(ONE_HUNDRED);

        vm.roll(block.number + 3);              // 3 blocks -> accumulated but not yet claimed
        // Now stake additional amount - rewards should be calculated up to this point
        vault.stake(ONE_HUNDRED);               // stake another 100

        vm.roll(block.number + 2);              // 2 more blocks
        // Claim - expected = (3 * RATE) + (2 * RATE)
        vault.claimRewards();
        uint256 expected = (3 + 2) * vault.REWARD_RATE();
        assertEq(token.balanceOf(sam), ONE_THOUSAND - (2 * ONE_HUNDRED) + expected);

        vm.stopPrank();
    }

    /* ============================
       4) Access control
       ============================ */

    function testOnlyOwnerCanEmergencyWithdraw() public {
        // Setup: transfer some tokens to vault to have a balance
        token.transfer(address(vault), ONE_HUNDRED);

        // Action & Assert: non-owner cannot call emergencyWithdraw
        vm.prank(sam);
        vm.expectRevert();
        vault.emergencyWithdraw(address(token), 1 * 1e18);

        // Owner can withdraw
        uint256 ownerBefore = token.balanceOf(deployer);
        vault.emergencyWithdraw(address(token), 10 * 1e18);
        assertEq(token.balanceOf(deployer), ownerBefore + 10 * 1e18);
    }
}
