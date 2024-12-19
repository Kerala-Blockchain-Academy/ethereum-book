//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
contract Base{
   event base(string) ;
   modifier myModifier() virtual {
       emit base("In BaseModifier");
       _;
   }
   function baseFn() external virtual{
       emit base("in baseFn");
   }
   function notInherited( ) private{


   }


}
contract Child is Base{


   modifier myModifier() override{
       emit base("In Child overridden modifier");
       _;
   }
   function baseFn() public override{
       emit base("Overridden by Child");
     
   }
   function derivedFn() public myModifier{
       emit base("In DerivedFn");
      
   }
}
