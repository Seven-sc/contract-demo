// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract contractStructure {
    uint256 private balance;

    //构造函数
    constructor(uint256 _balance) {
        balance = _balance;
    }

    //事件
    event balanceAdded(uint256 oldValue, uint256 incr);
    //修饰器
    modifier IncrementRange(uint256 _incr) {
        //对函数的输入参数进行的约束
        require(_incr > 100, "too small!");
        // 执行被修饰函数的逻辑
        _;
    }

    function getBalance() public view returns (uint256) {
        return balance;
    }

    function addBalance(uint256 _incr) public IncrementRange(_incr) {
        uint256 oldValue = balance;
        balance += _incr;
        emit balanceAdded(oldValue, _incr);
    }

    function pureTest() public pure returns (uint256){
        uint256 x = 550;
        uint256 y = 200;
        return x + y;
    }
}
