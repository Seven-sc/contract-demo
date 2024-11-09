// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;
import "./ICallee.sol";

contract Caller {

    address private calleeAddress;

    constructor(address _calleeAddress) {
        calleeAddress = _calleeAddress;
    }


    function changeX(uint x) public {
        // 静态调用合约函数
        ICallee callee = ICallee(calleeAddress);
        callee.setX(x);
        
    }
    // 0xd9145CCE52D386f254917e481eB44e9943F39138

}