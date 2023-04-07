//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract SampleReceiveFallback {
    uint public lastValueSent;
    string public lastFunctionCalled;

    uint public myUint;
    function setMyUint (uint _myNewUint) public{
        myUint = _myNewUint;
        lastFunctionCalled="setMyUint";
    }


    receive() external payable{     //This is a receive function. It receives ether. It is called when there is no data feild in the message.
        lastValueSent = msg.value; 
        lastFunctionCalled = 'receive';
    }

/*
    fallback() external {           //This is a fallback function. This function is run  whenever there is data along with the transaction.
        //lastValueSent = msg.value;
        lastFunctionCalled = 'fallback';   
    }                               //This is currently defined as a non-payable function. So it cannot take any eth.
*/
    fallback() external payable{
        lastValueSent = msg.value;
        lastFunctionCalled = 'fallback';   
    }                               //However, this fallback function is declared as payable and so it can take eth. Also, it can act as a replacement for the receive function
}