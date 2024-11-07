// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

interface IERC20 {

    //Tether合约地址: 0xdac17f958d2ee523a2206206994597c13d831ec7
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function decimals() external view returns (uint8);
}