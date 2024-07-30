//SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
contract LoopControlDemo{
    function findSumC() public pure returns(uint sum){
        for(uint i=0; i<=10; i++){
            if(i==1)
                continue;
            sum = sum +i;
        }
    }
    function findSumB() public pure returns(uint sum){
        for(uint i=0; i<=10; i++){
            if(i==10)
                break;
            sum = sum +i;
        }
    }
}
