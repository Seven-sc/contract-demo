// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Callee {
    uint x;
    address public sender;
    address public origin;
    uint public timestamp;
    function setX(uint _x) public {
        x = _x;
        sender = msg.sender;
        origin = tx.origin;
        timestamp = block.timestamp;
    }

    function getX() public view returns (uint) {
        return x;
    }
}

contract Caller {
    address calleeAddress;

    address public sender;
    address public origin;
    uint public timestamp;

    constructor(address _calleeAddress) {
        calleeAddress = _calleeAddress;
    }

    function changeX(uint _x) public {
        Callee callee = Callee(calleeAddress);

        callee.setX(_x);
        sender = msg.sender;
        origin = tx.origin;
        timestamp = block.timestamp;
    }
}