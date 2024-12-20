//SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
contract ReturnDemo{

    uint ticketCount = 24;
    function getTicketNumber() public view returns (uint) {
        return ticketCount;
    }

    function getTicketNumber1() public view returns (uint output) {
        output = ticketCount;
    }
}	
