// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/// @title TokenVault - A simple staking vault with per-block rewards
contract TokenVault is ReentrancyGuard, Ownable {
    using SafeERC20 for IERC20;

    IERC20 public immutable token;

    mapping(address => uint256) public stakes;
    uint256 public totalStaked;

    mapping(address => uint256) public rewards;      // saved rewards
    mapping(address => uint256) public lastUpdate;   // last block updated

    // reward units are in token smallest units (i.e 1e18 for 18-decimal token)
    uint256 public constant REWARD_RATE = 100 * 1e18;

    event Staked(address indexed user, uint256 amount);
    event Unstaked(address indexed user, uint256 amount);
    event RewardsClaimed(address indexed user, uint256 amount);

    constructor(address _token) Ownable(msg.sender) {
        require(_token != address(0), "Invalid token address");
        token = IERC20(_token);
    }

    /* ========== STAKING ========== */

    function stake(uint256 amount) external nonReentrant {
        require(amount > 0, "Amount must be > 0");

        // update rewards up to this block for the user
        _updateRewards(msg.sender);

        // take tokens (will revert if not approved)
        token.safeTransferFrom(msg.sender, address(this), amount);

        stakes[msg.sender] += amount;
        totalStaked += amount;

        emit Staked(msg.sender, amount);
    }

    function unstake(uint256 amount) external nonReentrant {
        require(amount > 0, "Amount must be > 0");
        require(stakes[msg.sender] >= amount, "Not enough staked");

        //capture rewards before reducing stake
        _updateRewards(msg.sender);

        stakes[msg.sender] -= amount;
        totalStaked -= amount;

        token.safeTransfer(msg.sender, amount);

        emit Unstaked(msg.sender, amount);
    }

    function getUserStake(address user) external view returns (uint256) {
        return stakes[user];
    }

    /* ========== REWARDS ========== */

    /// @dev returns rewards accumulated since lastUpdate (pending)
    function calculateRewards(address user) public view returns (uint256) {
        uint256 last = lastUpdate[user];
        if (last == 0) {
            return 0;
        }
        uint256 blocksPassed = block.number - last;
        return blocksPassed * REWARD_RATE;
    }

    /// @notice claim accumulated rewards (pending + stored)
    function claimRewards() external nonReentrant {
        // compute fresh pending and add to stored
        _updateRewards(msg.sender);

        uint256 reward = rewards[msg.sender];
        require(reward > 0, "No rewards");

        // reset stored rewards and update lastUpdate
        rewards[msg.sender] = 0;
        lastUpdate[msg.sender] = block.number;

        token.safeTransfer(msg.sender, reward);

        emit RewardsClaimed(msg.sender, reward);
    }

    /* ========== INTERNALS ========== */

    /// @dev update rewards[user] with pending rewards and set lastUpdate to current block
    function _updateRewards(address user) internal {
        uint256 last = lastUpdate[user];
        if (last == 0) {
            // first time: set lastUpdate to current block (no pending rewards yet)
            lastUpdate[user] = block.number;
            return;
        }

        uint256 pending = calculateRewards(user);
        if (pending > 0) {
            rewards[user] += pending;
        }
        lastUpdate[user] = block.number;
    }

    /* ========== ADMIN ========== */

    /// @notice emergency withdraw tokens (owner only)
    function emergencyWithdraw(address _token, uint256 amount) external onlyOwner {
        IERC20(_token).safeTransfer(owner(), amount);
    }
}