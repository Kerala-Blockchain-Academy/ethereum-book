//SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract BookMapAdmin {
   enum status {sold,available}
   struct Book {
       string title;
       uint256 price; //rep amt in wei
       address owner;
       status bookStatus;
   }
   mapping(uint256 => Book) bookList;
   uint256 bookCount;
   address admin;
   bool public adminApproval;
   //Error check
   onstructor() {
       admin = msg.sender;
       adminApproval = true;
   }

   // a new book can be added only if approved by admin
   function setNewBook(string memory bTitle, uint256 bPrice) public returns (uint256) {
       require(adminApproval == true, "Admin approval required");
       require(bPrice > 10, "Price should be greater than commission amount");
       uint256 index = ++bookCount;
       bookList[index].title = bTitle;
       bookList[index].price = bPrice;
       bookList[index].owner = msg.sender;
       bookList[index].bookStatus = status.available;
       return index;
   }

 function getBook(uint256 index) public view returns (string memory,uint256,address) {
       return (bookList[index].title,bookList[index].price,bookList[index].owner);
   }


   function buyBook(uint256 index) public payable {
       require(msg.value >= bookList[index].price,"Insufficient Funds");
       require(bookList[index].bookStatus == status.available,"Book Unavailable");
       require(adminApproval == true,"Admin approval Required");
       uint256 balance = msg.value - bookList[index].price;
       payable(msg.sender).transfer(balance);
       payable(admin).transfer(10);
       payable(bookList[index].owner).transfer(bookList[index].price-10);
       bookList[index].owner = msg.sender; //assigning the new owner
       bookList[index].bookStatus = status.sold;
   }
  //to put a book for Sale
   function putBookForSale(uint256 index) public {
       require(msg.sender == bookList[index].owner, "Only available for Book owner");
       bookList[index].bookStatus = status.available;
   }


   function setAdminApproval() public {
       require(msg.sender == admin, "Only available for Admin");
       adminApproval = true;
   }


   function resetAdminApproval() public {
       require(msg.sender == admin, "Only available for Admin");
       adminApproval = false;
   }
}







































   
  
