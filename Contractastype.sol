//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
contract A{
   string msgA="Hello from A";


   function setMsgA(string memory _msg)public{
       msgA=_msg;
   }
   function getMsgA() public view returns(string memory){
       return msgA;
   }
 
}


contract B{
   event newcontractA(address);
  
   function getMsgFromA(address contractAddress) public view returns(string memory){
       A aObj = A(contractAddress);
       return aObj.getMsgA();
   }
      function setMsgFromA(address contractAddress) public  {
       A aObj = A(contractAddress);
       aObj.setMsgA("Hello from B");
   }
   function deployNewA()public{
       A objA = new A();
       emit newcontractA(address(objA));
   }
}
