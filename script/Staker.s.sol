// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/ExampleExternalContract.sol";
import "../src/Staker.sol";

contract StackerScript is Script {
    ExampleExternalContract public exampleExternalContract;

    function run() external returns (Staker) {
        vm.startBroadcast();
        Staker staker = new Staker(address(exampleExternalContract));

        vm.stopBroadcast();
        return staker;
    }
}
// 0: contract Staker 0x582BaA4831D672906879699b822a735A74100b22

// ## Setting up (1) EVMs.

// ==========================

// Chain 11155111

// Estimated gas price: 5.21342048 gwei

// Estimated total gas used for script: 615093

// Estimated amount required: 0.00320673844330464 ETH

// ==========================

// ###
// Finding wallets for all the necessary addresses...
// ##
// Sending transactions [0 - 0].
// ⠁ [00:00:00] [#########################################################################################################################################] 1/1 txes (0.0s)
// Transactions saved to: /Users/anerishah/foundry/Decentralized-Staking-App/broadcast/Staker.s.sol/11155111/run-latest.json

// Sensitive values saved to: /Users/anerishah/foundry/Decentralized-Staking-App/cache/Staker.s.sol/11155111/run-latest.json

// ##
// Waiting for receipts.
// ⠉ [00:00:07] [#####################################################################################################################################] 1/1 receipts (0.0s)
// ##### sepolia
// ✅ Hash: 0x6348b1a292da2561ba549c14b506831deedbf688c06f3f6f921a950f0912de49
// Contract Address: 0x582BaA4831D672906879699b822a735A74100b22
// Block: 3756875
// Paid: 0.001930442569118558 ETH (473279 gas * 4.078868002 gwei)

// Transactions saved to: /Users/anerishah/foundry/Decentralized-Staking-App/broadcast/Staker.s.sol/11155111/run-latest.json

// Sensitive values saved to: /Users/anerishah/foundry/Decentralized-Staking-App/cache/Staker.s.sol/11155111/run-latest.json

// ======================
