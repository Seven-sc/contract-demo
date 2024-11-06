// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;
import "./Callee.sol";

contract Caller {
    address calleeAddress;

    constructor(address _calleeAddress) {
        calleeAddress = _calleeAddress;
    }

    function changeX(uint _x) public {
        Callee callee = Callee(calleeAddress);

        callee.setX(_x);
    }
}