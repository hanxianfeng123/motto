// SPDX-License-Identifier: GPL-3.0
// 声明合约的授权许可

pragma solidity ^0.8.0;
// 声明 Solidity 的版本号

contract Motto {
    // 定义一个名为 Motto 的合约

    uint public balance; // 公共状态变量，用于存储余额

    mapping (address => string) private messages;
    // 用于将地址与字符串消息关联起来的私有映射

    event NewMsg(address indexed sender, string message);
    // 声明一个名为 NewMsg 的事件，用于记录新消息

    function addMessage(string memory message) public {
        // 添加一条新的消息到映射中，并触发事件

        messages[msg.sender] = message;
        emit NewMsg(msg.sender, message);
    }

    function getMessage(address user) public view returns(string memory) {
        // 根据指定用户的地址返回相应的消息

        return messages[user];
    }
}