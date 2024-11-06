// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Callee {
    uint x;
    function setX(uint _x) public {
        x = _x;
    }

    function getX() public view returns (uint) {
        return x;
    }
}

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