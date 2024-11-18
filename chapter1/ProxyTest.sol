// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract LogicV1{
    address public logic;
    uint256 public count;

    function inc() public  {
        count+=1;
    }
}
contract LogicV2{
    address public logic;
    uint256 public count;

    function inc() public  {
        count+=2;
    }
}

interface LogicInterface {
    function inc() external;
}

contract Proxy{
    address public logic;

    // proxy持有业务数据，但不处理业务数据
    uint256 public count;

    constructor (address _logic) {
        logic = _logic;
    }

    fallback() external {
        (bool success, bytes memory data) = logic.delegatecall(msg.data);
        require(success, "delegatecall failed!");
    }

    function upgradeTo(address newLogic) external   {
        logic = newLogic;
    }
}

