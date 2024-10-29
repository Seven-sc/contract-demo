// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract ComplexValueType {
    
    // 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4 账号
    // 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4 函数返回
    // 获取发送方的地址
    function addressTest() public view returns (address) {
        address addr = msg.sender;
        return addr;
    }

    //0xb27A31f1b0AF2946B7F582768f03239b1eC07c2c
    //0xb27A31f1b0AF2946B7F582768f03239b1eC07c2c
    // 获取本合约的地址
    function myAddressTest() public view returns (address) {
        address addr = address(this); // this指本合约，address(this)将本合约显示转换为address类型
        return addr;
    }

    //定长字节数组
    function fixedByteArrayTest() public pure returns (bytes3) {
        bytes3 data = 0x121212; // 3个字节
        return data;
    }
}