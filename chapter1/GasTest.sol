// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract GasTest {
    uint256 i;
    uint256 public  gasRemain;

    function incr() public {

        while (i < 100) {
            if (i ==10) {
                gasRemain = gasleft();
            }

            i+=1;
        }
    }
}

contract GasCaller {

    address gasTest;

    constructor(address addr) {
        gasTest = addr;
    }

    function callGasTest() public {
        bytes memory bt = abi.encodeWithSignature("incr()");
        (bool success, bytes memory data) = gasTest.call{gas:28000}(bt);

        if (!success) {
            revert("gas not enough");
        }
    }
}