// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Crowdfunding {
    address public owner;
    uint public goalAmount;
    uint public deadline;
    uint public totalContributed;

    mapping(address => uint) public contributions;

    event ContributionReceived(address contributor, uint amount);
    event GoalReached();
 
    constructor(uint _goalAmount, uint _deadline) {
        owner = msg.sender;
        goalAmount = _goalAmount;
        deadline = block.timestamp + _deadline;
    }

    function contribute() public payable {
        require(block.timestamp < deadline, "Crowdfunding has ended");
        require(totalContributed < goalAmount, "Goal already reached");
        require(msg.value > 0, "Contribution must be greater than zero");

        contributions[msg.sender] += msg.value;
        totalContributed += msg.value;

        address receiver = owner;
        payable(receiver).transfer(msg.value);

        emit ContributionReceived(msg.sender, msg.value);

        if (totalContributed >= goalAmount) {
            emit GoalReached();
        }
    }

}
