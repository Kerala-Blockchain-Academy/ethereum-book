// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
import {MyLib} from "./Library.sol";
contract MyContract{
  using MyLib for uint;
  uint x;
  uint y;
  function setXY(uint a, uint b) public {
      x=a;
      y=b;
  }
  function getXpowerY()public view returns(uint){
      return x.power(y);
  }
  function checkXisEven()public view returns(bool){
      return x.isEven();
  }
     function checkYisEven()public view returns(bool){
      return y.isEven();
  }
}
