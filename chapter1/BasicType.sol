// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract BasicType {

    enum orderState {layorder, payment}


    function enumTest() public pure returns (orderState) {
        orderState state = orderState.payment;
        return state;
    }
    
    function typeTest() public pure returns (uint) {
        uint8 max = type(uint8).max;
        // 溢出报错
        //uint8 tt = ++max;
        return max;
    }
}