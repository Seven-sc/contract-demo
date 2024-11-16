// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract DelegateCall {

    uint public  num;
    address public sender;
    uint public value;

    function setX(uint _num) public payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}

contract DelegateTest{
    uint public  num;
    address public sender;
    uint public value;

    function delegateTest(address addr, uint _num) public payable  {
        (bool success, bytes memory data) =addr.delegatecall(abi.encodeWithSignature("setX(uint256)", _num));
        require(success, "delegatecall failed!");
    }
}