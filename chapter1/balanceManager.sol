// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract balanceManager {
    mapping(address => uint256) public balanceOf;

    string public name = "MYB";
    string public symbol = "$";
    uint8 public decimals = 4;

    constructor(uint256 _balance) {
        balanceOf[msg.sender] = _balance;
    }

    function transfer(address to, uint256 amount) public {
        address from = msg.sender;
        uint256 fromAmount = balanceOf[from];
        uint256 toAmount = balanceOf[to];

        require(amount < fromAmount, "Insufficient balance!");
        fromAmount -= amount;
        toAmount += amount;
        balanceOf[from] = fromAmount;
        balanceOf[to] = toAmount;
    }

    //account3 0x63D3A34b946d8EcC4eAEACc00f1ae308E65C057c
    //account2 0xFc08A35AF38d7Daf26b352C02EFC5b1852C566a7
}