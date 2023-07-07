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
