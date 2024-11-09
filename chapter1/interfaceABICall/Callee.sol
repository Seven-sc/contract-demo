// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Callee {

    uint private x;

    function setX(uint _x) public returns (uint)  {
        x = _x;
        return x;
    }

    function getX() public view returns (uint) {
        return x;
    }
}