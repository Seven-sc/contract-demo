// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

abstract contract Base {

    string private name;

    constructor(string storage _name) {

    }

    function foo() internal virtual  {
        
    }
}

contract contractA is Base {
    string private name;

    constructor() Base(name) {

    }

    function foo() internal override  {

    }
}