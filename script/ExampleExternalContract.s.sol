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
