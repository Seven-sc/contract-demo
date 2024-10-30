// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract MappingType {

    mapping(string => uint8) ages;

    function getAge(string memory name) public view returns (uint8) {
        return ages[name];
    }

    function setAge(string memory name, uint8 age) public {
        ages[name] = age;
    }
}