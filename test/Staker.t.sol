// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Staker.sol";
import "../src/ExampleExternalContract.sol";

contract StakerTest is Test {
    Staker public staker;
    ExampleExternalContract public exampleExternalContract;
    uint256 public bal = address(staker).balance;

    // modifier startAtPresenttime() {
    //     vm.warp(block.timestamp);
    //     _;
    // }

    function setUp() public {
        exampleExternalContract = new ExampleExternalContract();
        //payable (address(exampleExternalContract)) = address(1);
        staker = new Staker(address(exampleExternalContract));
        console.log(address(exampleExternalContract));
        console.log(address(staker));
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

    function testExecute() public {
        testStake();
        vm.warp(block.timestamp + 30 seconds);
        staker.execute();

        assertEq(address(exampleExternalContract).balance, 3 ether);
    }

    function testExecutionFail() public {
        vm.deal(address(1), 1 ether);
        vm.prank(address(1));
        staker.stake{value: 0.5 ether}();
        vm.warp(block.timestamp + 30 seconds);
        staker.execute();

        assertEq(address(exampleExternalContract).balance, 0 ether);
        assertEq(address(1).balance, 0.5 ether);
    }

    function testWithdraw() public {
        vm.deal(address(1), 3 ether);
        vm.startPrank(address(1));
        staker.stake{value: 1 ether}();
        vm.warp(block.timestamp + 30 seconds);
        console.log(address(staker).balance);
        staker.execute();
        staker.withdraw(payable(address(1)));

        assertEq(address(staker).balance, 0 ether);
    }
}
