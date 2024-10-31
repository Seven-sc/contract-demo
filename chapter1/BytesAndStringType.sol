// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract BytesAndStringType {

    string ss = "BytesAndStringType";
    string ss0 = "qqqeee";
    bytes ss1 = "BytesAndStringType1";

    function testStringAndBytes() public returns (string memory) {

        bytes1 b1 = ss1[0];
        bytes3 b3 = 0x121212;
        b1 = b3[0];

        //ss = "sss";
        ss = ss0;
        //bytes memory dd = "dddd";

        return ss;
    }

    function getSS() public view returns (string memory) {
        return ss;
    }
}