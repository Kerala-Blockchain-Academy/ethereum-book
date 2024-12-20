//SPDX-License-Identifier:MIT
pragma solidity ^0.8.19;
import "./Contractastype.sol";

contract OtherContract{
  string public msgA="OtherContract";
   function testCall(A addrs) public returns(bool,bytes memory){
      A cont = A(addrs);
      (bool success, bytes memory result) = address(cont).call(abi.encodeWithSignature("setMsgA(string)", "Testcall"));
      return (success,result);
   }
   function testDelegateCall(A addrs) public returns(bool,bytes memory){
      A cont = A(addrs);
      (bool success, bytes memory result) = address(cont).delegatecall(abi.encodeWithSignature("setMsgA(string)", "TestDelCall"));
      return (success,result);
   }
//staticall will fail as it is attempting to change state of calling contract
   function testStaticCall() public returns(bool,bytes memory){
      (bool success, bytes memory result) = address(this).staticcall(abi.encodeWithSignature("setMsgHere(string)", "TestStatcall"));
      return (success,result);
  }

  function setMsgHere(string memory imsg)public{
      msgA=imsg;
  }
}
