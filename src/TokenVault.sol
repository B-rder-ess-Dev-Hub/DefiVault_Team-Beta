// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./SimpleToken.sol";

contract TokenVault {
    SimpleToken public token;

    mapping(address => uint256) public stakes;
    uint256 public totalStaked;

    constructor(address _token) {
        token = SimpleToken(_token);
    }

    function stake(uint256 amount) external {
        require(amount > 0, "Amount must be > 0");

        token.transferFrom(msg.sender, address(this), amount);
        stakes[msg.sender] += amount;
        totalStaked += amount;
    }

    function unstake(uint256 amount) external {
        require(stakes[msg.sender] >= amount, "Not enough staked");

        stakes[msg.sender] -= amount;
        totalStaked -= amount;
        token.transfer(msg.sender, amount);
    }

    function getUserStake(address user) external view returns (uint256) {
        return stakes[user];
    }
}
