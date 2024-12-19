//SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
contract LoopDemo{

    function whileDemo(uint n) public pure returns(uint) {
       uint i=1;
       uint sum=0;
       while(i<=n){
           sum = sum + i;
           i = i+1;
       }
       return sum;
   }

   function doWhileDemo(uint n) public pure returns(uint) {
       uint i=1;
       uint sum=0;
       do {
           sum = sum + i;
           i = i+1;
       } while(i<=n);
       return sum;
   }

    function forDemo(uint n) public pure returns(uint) {
       uint sum=0;
       for(uint i=1; i<=n;i++){
           sum = sum + i;
       }
       return sum;
   }


}
