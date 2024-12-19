//SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract BlockParameters {
    uint256 prevrandao;
    uint256 gasLimit;
    uint256 latestBlock;
    uint256 timestamp;
    uint256 etherTransferred;
    address sender;
    address origin;
    address owner;
    address feeRecipient;


    constructor(){
        owner = msg.sender;
    }

    function setBlockParameters() public payable  {
        prevrandao = block.prevrandao;
        gasLimit = block.gaslimit;
        latestBlock = block.number;
        timestamp = block.timestamp;
        etherTransferred = msg.value;
        sender = msg.sender;
        origin = tx.origin;
        feeRecipient= block.coinbase;
    }

    function getBlockParameters() public view returns (uint256,uint256,uint256,uint256,uint256,address,address,address) {
        return (prevrandao,gasLimit,latestBlock,timestamp,etherTransferred,sender,origin,feeRecipient);
    }
    function getContractBalance()public view returns(uint256){
        return address(this).balance;
    }
}
