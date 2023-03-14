
// SPDX-License-Identifier: GPL-3.0
/* 
该合约实现了一个基本的 ERC20 标准发币合约，包括以下功能：

初始化时指定总量，将所有代币分配给合约创建者。
支持转账方法 transfer，在转账时会检查余额是否充足，并触发转账事件。
*/
pragma solidity ^0.8.0;

contract MyToken {
    string public name = "iToken";  // Token 名称
    string public symbol = "MTK";    // Token 缩写
    uint8 public decimals = 18;      // Token 小数位数
    uint256 public totalSupply;      // Token 总量

    mapping(address => uint256) public balanceOf;  // 每个账户的余额

    event Transfer(address indexed from, address indexed to, uint256 value);  // 转账事件

    constructor(uint256 initialSupply) {
        totalSupply = initialSupply;
        balanceOf[msg.sender] = initialSupply;
    }

    // 转账方法
    function transfer(address to, uint256 value) public returns (bool success) {
        require(balanceOf[msg.sender] >= value, "Insufficient balance");
        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;
        emit Transfer(msg.sender, to, value);
        return true;
    }
}