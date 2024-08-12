// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
interface Shape{
   function getArea() external  returns (uint256);
   function getPerimeter() external returns(uint256);
}


contract Square is Shape{
   uint256 side;


   function setSide(uint256 len)public{
       side = len;
   }
   function getArea() public view override returns(uint256){
       return (side*side);
   }
   function getPerimeter() public view override returns(uint256){
       return (4*side);
   }
   function getSide( ) public view returns(uint256){
       return side;
   }
}


contract Rectangle is Shape{
   uint256 length;
   uint256 breadth;


   function setLengthBreadth(uint256 len,uint256 brd)public{
       length = len;
       breadth = brd;
   }
   function getArea() public view override returns(uint256){
       return (length*breadth);
   }
   function getPerimeter() public view override returns(uint256){
       return (2*(length+breadth));
   }
   function getLengthBreadth( ) public view returns(uint256,uint256){
       return (length,breadth);
   }
}
