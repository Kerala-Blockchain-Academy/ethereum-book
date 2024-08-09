//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
contract BookManagement{
   enum status {sold,available}
   struct Book{
       string title;
       uint256 price; //rep amt in wei
       address owner;
       status bookStatus;
   }
   mapping(uint256=>Book) bookList;
   uint bookCount;
   event BookAdded(uint256 bookIndex);
   event BookSold(uint256 indexed bookIndex, address newOwner);
   address admin;
   bool public adminApproval;

   
  








































































   
