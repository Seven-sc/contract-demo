// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;
// 测试值拷贝和引用拷贝
contract LocalStorage {

    int256[] data1;
    int256[] data2;

    function setData1(int256 item) public {
        data1.push(item);
    }

    function setData2(int256 item) public {
        data2.push(item);
    }

    function getData1() public view returns (int256[] memory) {
        return data1;
    }
    function getData2() public view returns (int256[] memory) {
        return data2;
    }

    function testData2ToData1() public {
        // 值拷贝
        data1 = data2;
    }

    function test2(uint256[] memory p) public pure {
        uint256[] memory p1;
        // 引用拷贝
        p1 =p;
    }
}