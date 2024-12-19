// SPDX-License-Identifier: MIT
pragma solidity 0.8.26; 
contract RangeCheck{
        uint8 a =200;
        uint8 b=200;
        uint8 sum;
    function getMinUint() public pure returns(uint8,uint16,uint24) {
        return (type(uint8).min, type(uint16).min, type(uint24).min);
    }
    function getMaxUint() public pure returns(uint8,uint16,uint24) {
        return (type(uint8).max, type(uint16).max, type(uint24).max);
    }
    function getMinInt() public pure returns(int8,int16,int24) {
        return (type(int8).min, type(int16).min, type(int24).min);
    }
    function getMaxInt() public pure returns(int8,int16,int24) {
        return (type(int8).max, type(int16).max, type(int24).max);
    }
    function getMinMaxInt() public pure returns(int8,int8) {
        return (type(int8).min, type(int8).max);
    }
    function sumCheck() public  returns(uint8){
       sum = a+b;
       return sum;
    }
}
