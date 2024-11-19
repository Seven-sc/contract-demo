// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

// 逻辑合约
contract Logic {
    uint public count;

    function inc() external {
        count += 5;
    }
}

// 非结构化代理合约  slot:存储槽 专栏存储布局中有提到
contract UnstructuredProxy {
    // 定义逻辑合约地址的存储位置，注意这里使用的是constant；constant变量并不参与成员变量的堆叠，
    //或者说并不会占用slot 存储槽。
    //简单解释一下这里为什么要设置这个变量；
    //在基础代理模式中，Proxy会声明一个logicAddress的成员变量保存,所以会占用存储布局，那么Logic合约就会出现占位符 logicAddress，以保证存储布局一致；
    //我们在这设置一个hash作为setLogic函数中汇编sstore(position, newLogic)，将这个地址存到slot hash中，所以这里的logicPosition要足够远，确保不会参与堆叠
    bytes32 private constant logicPosition = keccak256("org.zeppelinos.proxy.implementation"); 

    // 升级到新的逻辑合约地址
    function upgradeTo(address newLogic) public {   
        setLogic(newLogic); 
    } 

    // 获取当前的逻辑合约地址
    function logic() public view returns(address impl) {  
        bytes32 position = logicPosition;   
        assembly {
            impl := sload(position) //读取slot position中的数据
        } 
    } 

    // 内部函数设置新的逻辑合约地址
    function setLogic(address newLogic) internal {   
        bytes32 position = logicPosition;   
        assembly {
            sstore(position, newLogic) //将newLogic 地址 存储到position位置
        } 
    } 

    // 使用内联汇编委托调用
    function _delegate(address _logic) internal virtual {
        assembly {
            //这里简单解释，不能保证正确；
            //calldatacopy是针对calldata的函数，他会直接找到calldata，根据参数决定copy多长的字节
            //calldatasize()针对calldata，取到calldata的size  字节大小
            //(t, f, calldatasize())
            //t是合约的内存空间起点，f是调用数据（`calldata`）的起点。
            //注意这里是memory内存，所以并不会存在storage里，只存活于函数指定期间
            calldatacopy(0, 0, calldatasize())

            //对_logic合约地址使用delegatecall
            let result := delegatecall(gas(), _logic, 0, calldatasize(), 0, 0)
            
            //这里就跟上边的差不多了 returndatacopy  返回结果result 
            returndatacopy(0, 0, returndatasize())
            
            //check result
            switch result
            
            
            case 0 {
            // 0 就直接回滚
                revert(0, returndatasize())
            }
            default {
            // 默认返回  返回数据给外部调用者 
                return(0, returndatasize())
            }
        }
    }

    // 当调用不匹配任何函数时触发
    fallback() external {
        _delegate(logic());
    }
}
