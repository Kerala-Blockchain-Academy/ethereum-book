//SPDX-License-Identifier: MIT
pragma solidity 0.8.17;
contract Contract {
   address payable admin;
   constructor() {
       admin = payable(msg.sender);
   }
   function destroy() public {
       require(msg.sender==admin,"Unauthorized Operation");
       selfdestruct(admin);
   }
   receive() external payable{


   }


}

