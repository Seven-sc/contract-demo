// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

abstract contract Base {

    uint public  x = 5;

    event Log(string message);

    constructor() {
        
    }

    function bar() public virtual {
        emit Log("Base.bar called");
    }

}

contract contractA is Base {
    
    constructor() {
        x += 10;
    }

    function bar() public virtual override  {
        emit Log("contractA.bar called");
        super.bar();
    }
}

contract contractB is Base {

    constructor() {
        x *= 10;
    }

    function bar() public virtual override  {
        emit Log("contractB.bar called");
        super.bar();
    }
}

contract contractC is  contractA, contractB {

    function bar() public override(contractA, contractB)   {
        emit Log("contractC.bar called");
        super.bar();
    }
}