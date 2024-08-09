// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
contract Bank{
   mapping(address=>uint) balanceLedger;//<acc1,bal>, <acc2,bal>,
   mapping(uint=>address) index;
   uint addressCount;
   address owner;
   event depositEvent(address depositorAcc, uint deposit);
   modifier balanceCheck(uint amt){
       require(amt <= balanceLedger[msg.sender],"Insufficient Balance");
       require((balanceLedger[msg.sender]-amt)>50,"Minimum Balance Violation"); // minimum balance
       _;
   }
    modifier onlyOwner(){
       require(msg.sender==owner,"Access denied");
       _;
   }
   
  constructor(){ 
   admin=msg.sender;
}
   function deposit()public payable{
       if(balanceLedger[msg.sender]==0){
           index[addressCount++]=msg.sender; // index mapping key starts from 0
       }
       balanceLedger[msg.sender] += msg.value; //shorthand operator
       emit depositEvent(msg.sender,msg.value);
   }
function withdraw(uint amt)public balanceCheck(amt){
       balanceLedger[msg.sender] -= amt;
       payable(msg.sender).transfer(amt);
      
   }


   function transferToAnother(address payable recipient,uint amt)public  balanceCheck(amt){
       balanceLedger[msg.sender] -= amt;
       recipient.transfer(amt);
   }
   function getMyBalance()public view returns(uint){
       return balanceLedger[msg.sender];
   }
   function deleteMyAccount()public {
       payable(msg.sender).transfer(balanceLedger[msg.sender]);
       delete balanceLedger[msg.sender];
   }


   function getBankBalance() public view returns(uint){
       return address(this).balance;
   }
   function dissolveBank() public onlyOwner(){
       address indexAddress;
       for(uint i=0; i<addressCount;i++){
           indexAddress = index[i];
           payable(indexAddress).transfer(balanceLedger[indexAddress]);
           delete balanceLedger[indexAddress];
           delete index[i];
       }
       delete addressCount;
   }
  
}








   

   
