# MiniDeFi: Beginner-Friendly DeFi Project

A minimal DeFi project to learn smart contract development basics using Foundry and OpenZeppelin.

## Quick Start

### 1. Setup Environment
```bash
# Install Foundry
curl -L https://foundry.paradigm.xyz | bash
foundryup

# Create project
forge init minidefi
cd minidefi

# Install OpenZeppelin
forge install OpenZeppelin/openzeppelin-contracts
```

### 2. Project Structure
```
minidefi/
├── src/
│   ├── SimpleToken.sol      # ERC20 Token
│   ├── TokenVault.sol       # Staking Contract
│   └── interfaces/
├── test/
│   └── MiniDeFi.t.sol       # Tests
└── script/
    └── Deploy.sol           # Deployment
```

## Tasks

### Task 1: Simple ERC20 Token
**File:** `src/SimpleToken.sol`

**Instructions:**
1. Import OpenZeppelin ERC20 and Ownable
2. Create `SimpleToken` contract
3. Constructor: Set name "MiniToken", symbol "MINI", mint 1 million tokens to deployer
4. Add public `mint` function (only owner can call)

**What you'll learn:** Basic token creation, OpenZeppelin imports, constructor setup.

### Task 2: Token Vault with Staking
**File:** `src/TokenVault.sol`

**Instructions:**
1. Create `TokenVault` contract
2. Add mapping to track user stakes: `mapping(address => uint256) public stakes;`
3. Add total staked counter: `uint256 public totalStaked;`
4. Implement these functions:
   - `stake(uint256 amount)`: Transfer tokens from user, update stakes
   - `unstake(uint256 amount)`: Return tokens to user, update stakes
   - `getUserStake(address user)`: Return user's staked amount



### Task 3: Add Rewards System
**In `TokenVault.sol`:**
1. Add rewards mapping: `mapping(address => uint256) public rewards;`
2. Add constant reward rate: `uint256 public constant REWARD_RATE = 100;` // 100 tokens per block
3. Add last update tracking: `mapping(address => uint256) public lastUpdate;`
4. Implement:
   - `calculateRewards(address user)`: Returns (current block - lastUpdate) * REWARD_RATE
   - `claimRewards()`: Transfer calculated rewards to user
   - Update `stake` and `unstake` to calculate rewards first

**What you'll learn:** Reward calculations, state updates, basic algorithms.

### Task 4: Basic Access Control
**In `TokenVault.sol`:**
1. Import OpenZeppelin Ownable
2. Add `onlyOwner` modifier to critical functions
3. Add emergency `withdrawStuckTokens` function (only owner)


## Testing

**File:** `test/MiniDeFi.t.sol`

**Instructions:**
1. Set up test contract with `setUp()` function
2. Deploy tokens and vault in setup
3. Write tests for:
   - Token minting and transfers
   - Staking and unstaking
   - Reward calculations
   - Access control

**Example test structure:**
```solidity
function testStaking() public {
    // Setup
    // Action
    // Assert
}
```

## Deployment

**File:** `script/Deploy.sol`

**Instructions:**
1. Create deployment script
2. Deploy SimpleToken
3. Deploy TokenVault
4. Set up initial roles if needed

## Build & Test Commands

```bash
# Build
forge build

# Test
forge test

# Test with details
forge test -vvv

# Deploy to local network
forge script script/Deploy.sol --fork-url http://localhost:8545 --broadcast
```

## What You'll Build

- ✅ ERC20 token with minting
- ✅ Staking vault with rewards
- ✅ Basic access control
- ✅ Complete test suite
- ✅ Deployment scripts






## Resources

- [OpenZeppelin Documentation](https://docs.openzeppelin.com/)
- [Foundry Book](https://book.getfoundry.sh/)
- [Solidity Documentation](https://docs.soliditylang.org/)
- [Ethereum Developer Resources](https://ethereum.org/developers/)

This Project covers all the core concepts you've learnt for the past 5 weeks without being overwhelming. Start with Task 1 and build step by step.

Remember to commit your work regularly, as you contribution to the repository will be tracked. Don't hesitate to research each concept thoroughly. Happy coding! 🚀
