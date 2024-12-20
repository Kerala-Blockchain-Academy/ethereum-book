// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.19;
contract ArrayDemo{
  
    bytes[] public dynamicB = new bytes[](3);
    string[] public dyString = new string[](2);
     

    function getBytes(bytes20 fbyteVal, bytes memory dbyteVal) public pure returns(bytes1,bytes2,uint,uint){
        bytes1 b1 = fbyteVal[0];
        bytes1 b2 = dbyteVal[0];
        return(b1,b2,fbyteVal.length,dbyteVal.length);
    }
    function dynamicByteArray(bytes memory x, bytes memory y, bytes memory z) public returns(uint){
        dynamicB[0]=x;
        dynamicB[1]=y;
        dynamicB[2]=z;
        return dynamicB.length;
    }
    function getStrings(string memory fstr) public pure returns(bytes1,bytes2){
        /** check if below statement works
            bytes1 b1 = fstr[0];
        */
        bytes1 b1 = bytes(fstr)[0];
        bytes1 b2 = bytes(fstr)[1];
        return(b1,b2);
    }
    function dynamicStringArray(string memory xs,string memory ys) public returns(uint){
        dyString[0]=xs;
        dyString[1]=ys;
        return dyString.length;
    }
}
   
