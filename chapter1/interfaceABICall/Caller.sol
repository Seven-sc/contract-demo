// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Caller {

    address calleeAddress;
    uint public xx;

    constructor(address _calleeAddress) {
        calleeAddress = _calleeAddress;
    }

    function changeX(uint _x) public {
        bytes memory b = abi.encodeWithSignature("setX(uint256)", _x);
        (bool sucess, bytes memory returnData) = calleeAddress.call(b);

        if (sucess) {
            uint x = abi.decode(returnData, (uint));
            xx = x;
        } else {
            revert("call failed");
        }
    }
}