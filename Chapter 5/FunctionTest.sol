//SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
contract FunctionTest{
    uint var1;
       
    function getVar1() view external returns(uint){
        return var1;
    }

    function callSetVar1(uint _var) public{
        setVar1(_var);
        setVar2(_var);
    }

    function setVar1(uint _var1) private{
        var1 = _var1;
    }

    function setVar2(uint _var1) internal{
        var1 = _var1;
    }
}
    
