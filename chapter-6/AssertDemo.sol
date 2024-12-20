//SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
contract Demo{

function divideNumbers(uint256 a, uint256 b) public pure returns (uint256){
    assert(b!=0);
    return (a/b);
}
}
