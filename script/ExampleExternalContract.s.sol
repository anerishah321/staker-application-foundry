// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/ExampleExternalContract.sol";

contract ExampleScript is Script {
    ExampleExternalContract public exampleExternalContract;

    function run() external {
        vm.startBroadcast();
        exampleExternalContract = new  ExampleExternalContract();
        vm.stopBroadcast();
    }
}
// Chain 11155111

// Estimated gas price: 5.383136106 gwei

// Estimated total gas used for script: 114354

// Estimated amount required: 0.000615583146265524 ETH

// ==========================

// ###
// Finding wallets for all the necessary addresses...
// ##
// Sending transactions [0 - 0].
// ⠁ [00:00:00] [#########################################################################################################################################] 1/1 txes (0.0s)
// Transactions saved to: /Users/anerishah/foundry/Decentralized-Staking-App/broadcast/ExampleExternalContract.s.sol/11155111/run-latest.json

// Sensitive values saved to: /Users/anerishah/foundry/Decentralized-Staking-App/cache/ExampleExternalContract.s.sol/11155111/run-latest.json

// ##
// Waiting for receipts.
// ⠉ [00:00:07] [#####################################################################################################################################] 1/1 receipts (0.0s)
// ##### sepolia
// ✅ Hash: 0xef901bd0096ab4160488c6bf111a529b31440c6d993c88eb65fc447f1c111e1a
// Contract Address: 0xdA87d451a8109425B4D4aff978c7DD7a13039fF8
// Block: 3758114
// Paid: 0.000473592165197562 ETH (87977 gas * 5.383136106 gwei)

// Transactions saved to: /Users/anerishah/foundry/Decentralized-Staking-App/broadcast/ExampleExternalContract.s.sol/11155111/run-latest.json

// Sensitive values saved to: /Users/anerishah/foundry/Decentralized-Staking-App/cache/ExampleExternalContract.s.sol/11155111/run-latest.json

// ==========================

// ONCHAIN EXECUTION COMPLETE & SUCCESSFUL.
// Total Paid: 0.000473592165197562 ETH (87977 gas * avg 5.383136106 gwei)

// Transactions saved to: /Users/anerishah/foundry/Decentralized-Staking-App/broadcast/ExampleExternalContract.s.sol/11155111/run-latest.json

// Sensitive values saved to: /Users/anerishah/foundry/Decentralized-Staking-App/cache/ExampleExternalContract.s.sol/11155111/run-latest.json

// anerishah@Aneris-MacBook-Pro Decentralized-Staking-App %
