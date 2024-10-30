// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract StructType {

    struct Person {
        string name;
        uint8 age;
    }

    Person master;

    function readPerson() public view returns (Person memory) {
        return master;
    }

    function writePerson(Person memory p) public {
        master = p;
    }

    function writePersonName(string memory name) public {
        master.name = name;
    }

    function testStruct() public pure returns (Person memory) {
        Person memory p;
        p.age = 34;
        p.name = "Seven";
        return p;
    }

}