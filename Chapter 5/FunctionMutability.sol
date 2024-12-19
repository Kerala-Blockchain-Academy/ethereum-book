//SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
contract FunctionMutability{
    uint number;
       
    function get() public view returns(uint){
        return number;
    }

    function set(uint _number) public{
       number = _number;
    }

    function calculate(uint a, uint b) public pure returns(uint){
        return a+b;
    }

    function sendEther() public payable returns(uint){
        return address(this).balance;
    }

}
    
