// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
library MyLib{
   function power (uint x, uint y) internal pure returns (uint){
       uint res=1;
       for(uint i=1;i<=y;i++){
           res = res*x;
       }
       return res;
   }
   function isEven(uint x) internal pure returns(bool){
       if(x%2==0)
           return true;
       else  
           return false;
   }
}
