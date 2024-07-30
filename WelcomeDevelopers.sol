//SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
contract WelcomeDevelopers{
    
    string message = "Welcome Developers to Ethereum !"; 

    function getMessage()public view returns(string memory){
        return smessage;
    }

    function setMessage(string memory lmessage)public {
        smessage = lmessage;
    }
}
