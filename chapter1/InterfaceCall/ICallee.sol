// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

interface ICallee {
    function setX(uint _x) external;
    function getX() external view returns (uint);
}