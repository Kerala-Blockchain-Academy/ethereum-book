//SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
contract MyThisContract{


   function getMyContractAddress() public view returns (address) {
       return address(this);
   }  
   function getMyContractBalance() public view returns (uint) {
       return address(this).balance;
   }
    function getFunctionSignature() public pure returns(bytes4) {
       return this.getMyContractBalance.selector;
   }
}
