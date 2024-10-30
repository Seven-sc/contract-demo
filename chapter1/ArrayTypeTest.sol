// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract ArrayTypeTest {

    uint8[3] array;

    uint8[] array1;

    function arrayTest() public view returns (uint8[3] memory) {
        return array;
    }

    function dynamicArrayReadTest() public view returns (uint8[] memory) {
        return array1;
    } 

    function dynamicArrayWriteTest() public {
        array1.push(22);
        array1.push(33);
        array1.pop();
    }

    function dynamicMemoryArrayReadTest(uint size) public pure {
        // memory中的数组大小固定，没有push方法
        uint8[] memory arr = new uint8[](size);
        arr[0] = 123;
        //arr.push(11);
    }
}