// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
contract TestInt {
    function f(uint a, uint b) pure public returns (uint) {
       unchecked {
                return a - b; }
    }
    function g(uint a, uint b) pure public returns (uint) {
        return a - b;
    }
    function sum(uint8 a, uint8 b) public pure returns(uint){
        return a+b;
    }
     function sumUC(uint8 a, uint8 b) public pure returns(uint){
       unchecked{
        return a+b;
       } 
    }
    
