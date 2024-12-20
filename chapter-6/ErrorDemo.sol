//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
contract ErrorDemo{
   error DivisionByZero();

   function divide(uint256 a, uint256 b) public pure returns (uint256){
       if(b==0)
           revert DivisionByZero();
       else
           return (a/b);
   }
  
}
