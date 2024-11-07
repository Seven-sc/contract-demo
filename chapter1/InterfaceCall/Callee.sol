// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "./ICallee.sol";

contract Callee is ICallee {

    uint private x;
    function setX(uint _x) external {
        x = _x;
    }

    function getX() external  view returns (uint) {
        return x;
    }
}