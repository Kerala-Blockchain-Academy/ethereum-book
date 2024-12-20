//SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
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

   constructor(){
       admin = msg.sender;
       adminApproval = true;
   }
   modifier onlyAdmin() {
       require(msg.sender==admin,"Access Restricted to Admin");
       _;
   }
   modifier onlyOwner(uint index) {
       require(msg.sender==bookList[index].owner,"Access Restricted to Owner of Book");
       _;
   }
   modifier adminConsent(){
       require(adminApproval==true,"Admin Approval Required");
       _;
  }
   function setNewBook(string memory bTitle, uint256 bPrice) public adminConsent {
       require(bPrice > 10, "Price should be greater than commission amount");
       uint256 index = ++bookCount;
       bookList[index].title = bTitle;
       bookList[index].price = bPrice;
       bookList[index].owner = msg.sender;
       bookList[index].bookStatus = status.available;
       emit BookAdded(index);
   }


   function getBook(uint256 index) public view returns(string memory, uint256, address){
       return(bookList[index].title, bookList[index].price, bookList[index].owner);
   }
   
  
function buyBook(uint256 index)public adminConsent payable{
       require(msg.value >= bookList[index].price,"Insufficient Funds");
       require(bookList[index].bookStatus == status.available,"Book Unavailable");
       uint256 balance = msg.value - bookList[index].price;
       payable(msg.sender).transfer(balance);
       payable(admin).transfer(10);
       payable(bookList[index].owner).transfer(bookList[index].price-10);
       bookList[index].owner = msg.sender; //assigning the new owner
       bookList[index].bookStatus = status.sold;
       emit BookSold(index, msg.sender);
   }
  
  //to put a book for Sale
   function putBookForSale(uint256 index)public onlyOwner(index) {
       bookList[index].bookStatus= status.available;
   }


    function setAdminApproval()public onlyAdmin{
       adminApproval=true;
   }


    function resetAdminApproval()public onlyAdmin {
       adminApproval=false;
   }


}







































































   
