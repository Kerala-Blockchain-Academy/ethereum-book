//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
contract Management{
   event trigger(string);  
   fallback() external payable{
       emit trigger("fallback triggered");
   }
   receive()external payable{
       emit trigger("receive triggered");
   }
    function getContractBalance()public view returns (uint){
       return address(this).balance;
   }
}
