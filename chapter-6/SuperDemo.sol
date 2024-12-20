//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
contract Parent{
   uint x;
   function func(uint y) public virtual{
       x = y;
   }
}


contract Child is Parent{
 
   function func(uint y)public override{
       super.func(y);
   } 
   function getX() public view returns(uint){
       return x;
   }
}
