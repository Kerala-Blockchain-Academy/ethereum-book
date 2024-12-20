//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
contract CourseRegistration{


   mapping(address=>uint256) addressIndex;
   struct student{
       address s_address;
       string s_name;
   }
   mapping (uint256=>student) studentList;
   uint256 index=1;


   function addStudent(address stAddress, string memory stName) internal returns(uint256){
       if(addressIndex[stAddress]>=1)
           return addressIndex[stAddress];
       else{
           addressIndex[stAddress]=index;
           studentList[index].s_address = stAddress;
           studentList[index].s_name = stName;
           return index++ ;
       }
    
   }


   function getStudentDetails(address stAddress)public view returns(uint256,string memory){
       require(addressIndex[stAddress]>=1,"Not registered");
       uint256 stIndex = addressIndex[stAddress];
       return (stIndex,studentList[stIndex].s_name);
   }


}
contract CBAEnrollment is CourseRegistration{
   struct gradeCBA{
       uint8 quiz1;
       uint8 quiz2;
       uint8 report;
   }


   mapping(uint256=>gradeCBA) CBA_EnrollmentList;
   address admin;
   constructor(){
       admin = msg.sender;
   }


   function enrollCBA(string memory name)public{
      uint256 index = addStudent(msg.sender,name);
      CBA_EnrollmentList[index]=gradeCBA(0,0,0);
   }


   function issueCBACertificate(address student , uint8 
q1,uint8 q2, uint8 report) public {
       require(msg.sender==admin,"Insufficient Privilege");
       require(addressIndex[student]>=1,"Not registered");
       uint256 stIndex = addressIndex[student];
       CBA_EnrollmentList[stIndex] = gradeCBA(q1,q2,report);
   }


  function getCBAGrade(address student) public view   
   returns(gradeCBA memory){
       require(msg.sender==admin,"Insufficient Privilege");
       require(addressIndex[student]>=1,"Not registered");
       uint256 stIndex = addressIndex[student];
       return (CBA_EnrollmentList[stIndex]);
   }
  function getCBAGrade() public view returns(gradeCBA memory){
       require(addressIndex[msg.sender]>=1,"Not registered");
       uint256 stIndex = addressIndex[msg.sender];
       return (CBA_EnrollmentList[stIndex]);
   }


}
