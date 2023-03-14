// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Motto {

mapping (address=>string) private messages;

event NewMsg(address indexed sender, string message);

function addMessage(string memory message) public {
messages[msg.sender] = message;

emit NewMsg(msg.sender, message);
}

function getMessage(address user) public view returns(string memory) {
return messages[user];
}
}