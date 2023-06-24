// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Staker.sol";
import "../src/ExampleExternalContract.sol";

contract StakerTest is Test {
    Staker public staker;
    ExampleExternalContract public exampleExternalContract;
    uint256 public bal = address(staker).balance;

    modifier startAtPresenttime() {
        vm.warp(block.timestamp);
        _;
    }

    function setUp() external {
        staker = new Staker(address(exampleExternalContract));
    }

    function testStake() public {
        vm.deal(address(1), 1 ether);
        vm.prank(address(1));
        staker.stake{value: 1 ether}();

        hoax(address(2), 2 ether);
        staker.stake{value: 2 ether}();

        console.log(address(staker).balance);
        assertEq(address(staker).balance, (bal + 1 ether + 2 ether));
    }
}
