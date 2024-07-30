// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract DrivingLicense {
    
    modifier ageCheck( uint8 age) {
        if (age >= 18) 
            _;
	      else 
	        revert("Does not qualify minimum age limit");
    }
    
  function eligibleforLicense(string memory name, uint8 age) public ageCheck(age){
	  return true;
    }
}
