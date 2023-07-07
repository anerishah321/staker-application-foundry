// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "../src/ExampleExternalContract.sol";

contract Staker {
    ExampleExternalContract public exampleExternalContract;
    //create a mapping for store users and thier balances
    mapping(address => uint256) public balances;
    //minimum thereshold
    uint256 public constant threshold = 2 ether;
    //the deadline for the send tokens to this contract
    uint256 public deadline = block.timestamp + 30 seconds;
    //if thersgold not completed create a bool to withdraw
    bool public openForWithdraw;

    event Stake(address sender, uint256 value);

    //modefier if dedline is iver or not
    modifier deadlinePassed(bool requireDeadlinePassed) {
        uint256 timeRemaining = timeLeft();
        if (requireDeadlinePassed) {
            require(timeRemaining <= 0, "Deadline has not been passed yet");
        } else {
            require(timeRemaining > 0, "Deadline is already passed");
        }
        _;
    }

    //modefier for complete the stacking period
    modifier stakingNotCompleted() {
        bool completed = exampleExternalContract.completed();
        require(!completed, "Staking period has completed");
        _;
    }

    constructor(address exampleExternalContractAddress) {
        exampleExternalContract = ExampleExternalContract(exampleExternalContractAddress);
    }
    //deadlinePassed(false) stakingNotCompleted

    function stake() public payable deadlinePassed(false) {
        (balances[msg.sender] += msg.value);
        emit Stake(msg.sender, msg.value);
    }
    //stakingNotCompleted

    function execute() public {
        uint256 contractBalance = address(this).balance;
        if (contractBalance >= threshold) {
            exampleExternalContract.complete{value: contractBalance}();
        } else {
            openForWithdraw = true;
        }
    }

    function withdraw(address payable user) public payable deadlinePassed(true) stakingNotCompleted {
        require(openForWithdraw, "Not open for withdraw");
        uint256 userBalance = balances[msg.sender];
        require(userBalance > 0, "userBalance is 0");
        balances[msg.sender] = 0;
        (bool sent,) = user.call{value: userBalance}("");
        require(sent, "Failed to send to address");
    }
    //this function is for frontend

    function timeLeft() public view returns (uint256) {
        if (block.timestamp >= deadline) {
            return 0;
        } else {
            return deadline - block.timestamp;
        }
    }
    //to recive balance in stack contract

    receive() external payable {
        stake();
    }
}
