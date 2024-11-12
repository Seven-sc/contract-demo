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