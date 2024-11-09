// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract AbiDecode {

    function encode(uint a, address addr) public pure returns (bytes memory) {
        return abi.encode(a, addr);
    }

    function decode(bytes memory b) public pure returns (uint, address) {
        return abi.decode(b, (uint, address));
    }
}