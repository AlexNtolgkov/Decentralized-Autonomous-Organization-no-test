# DAO Governance Project

## Overview
This project implements a complete DAO governance system using Solidity smart contracts. It enables decentralized decision-making through a governance token, voting mechanisms, and time-locked execution of proposals.

## Project Structure
```
.
├── .github/workflows
├── lib
│   └── openzeppelin-contracts
├── src
│   ├── DAOGovernanceContract.sol
│   ├── RetrievableNumber.sol
│   ├── TimeLockContract.sol
│   └── VotingToken.sol
├── .gitignore
├── .gitmodules
├── README.md
└── foundry.toml
```

## Smart Contracts

### DAOGovernanceContract
The main governance contract that inherits from OpenZeppelin's Governor modules. Features include:
* Voting delay of 7200 blocks (approximately 1 day)
* Voting period of 50400 blocks (approximately 1 week)
* 4% quorum requirement
* Time-locked execution of passed proposals
* Simple majority voting system

### RetrievableNumber
A simple contract for storing and retrieving numbers that can be controlled by governance:
* Stores a single number value
* Emits events when the number changes
* Includes retrieval functionality

### TimeLockContract
Implements time-delayed execution of governance decisions:
* Customizable minimum delay
* Configurable proposers and executors
* Admin management functionality

### VotingToken (VTK)
An ERC20 token with governance capabilities:
* Implements ERC20Votes for governance functionality
* Includes ERC20Permit for gasless approvals
* Tracks voting power and delegation

## Setup and Installation
This project uses Foundry for Ethereum development.

1. Install Foundry:
```bash
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

2. Clone the repository:
```bash
git clone <your-repository-url>
cd dao-governance
```

3. Install dependencies:
```bash
forge install
```

## Building and Testing

### Build the project:
```bash
forge build
```

### Run tests:
```bash
forge test
```

## Deployment
To deploy the contracts in sequence (replace placeholders with actual values):

```bash
# 1. Deploy VotingToken
forge create src/VotingToken.sol:VotingToken --rpc-url <YOUR_RPC_URL> --private-key <YOUR_PRIVATE_KEY>

# 2. Deploy TimeLockContract
forge create src/TimeLockContract.sol:TimeLockContract --rpc-url <YOUR_RPC_URL> --private-key <YOUR_PRIVATE_KEY> --constructor-args <MIN_DELAY> <PROPOSERS_ARRAY> <EXECUTORS_ARRAY>

# 3. Deploy DAOGovernanceContract
forge create src/DAOGovernanceContract.sol:DAOGovernanceContract --rpc-url <YOUR_RPC_URL> --private-key <YOUR_PRIVATE_KEY> --constructor-args <VOTING_TOKEN_ADDRESS> <TIMELOCK_ADDRESS>
```

## Usage

### Creating a Proposal
To create a proposal, interact with the DAOGovernanceContract using a tool like cast:

```bash
cast send <GOVERNANCE_CONTRACT_ADDRESS> "propose(address[],uint256[],bytes[],string)" <TARGETS> <VALUES> <CALLDATAS> <DESCRIPTION> --rpc-url <YOUR_RPC_URL> --private-key <YOUR_PRIVATE_KEY>
```

### Voting on Proposals
Token holders can vote on active proposals:

```bash
cast send <GOVERNANCE_CONTRACT_ADDRESS> "castVote(uint256,uint8)" <PROPOSAL_ID> <VOTE> --rpc-url <YOUR_RPC_URL> --private-key <YOUR_PRIVATE_KEY>
```

## Contributing
Contributions are welcome. Please open an issue or submit a pull request.

## License
This project is licensed under the MIT License.
