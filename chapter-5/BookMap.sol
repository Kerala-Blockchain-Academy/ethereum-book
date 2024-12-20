//SPDX-License-Identifier: GPL
pragma solidity 0.8.19;
contract BookMap{
    enum status {sold,available}
    struct Book{
        string title;
        uint256 price; //rep amt in wei
        address owner;
        status bookStatus;
    }
    mapping(uint256=>Book) bookList;
    uint bookCount;
    
    function setNewBook(string memory bTitle, uint256 bPrice) public returns(uint256){
        uint256 index = ++bookCount;
        bookList[index].title = bTitle;
        bookList[index].price = bPrice;
        bookList[index].owner = msg.sender;
        bookList[index].bookStatus = status.available;
        return index;
    }

    function getBookDetails(uint256 index) public view returns(string memory, uint256, address){
        return(bookList[index].title, bookList[index].price, bookList[index].owner);
    }

    function buyBook(uint256 index)public payable{
        if(msg.value >= bookList[index].price && bookList[index].bookStatus==status.available){
            uint256 balance = msg.value -bookList[index].price;
            payable(msg.sender).transfer(balance);
            payable(bookList[index].owner).transfer(bookList[index].price);
            bookList[index].owner = msg.sender;
            bookList[index].bookStatus= status.sold;
        }
    }
  
   //to put a book for Sale 
    function putBookForSale(uint256 index)public  {
        if(msg.sender==bookList[index].owner)
            bookList[index].bookStatus= status.available;
    }
    
}
