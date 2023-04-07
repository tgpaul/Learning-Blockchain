//This contract is to learn how to send transactions to and from smart contracts

//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract SamplePayable{
    string public myString = "Hello World!";

    function upadteString (string memory _myString) public payable{
        if(msg.value == 1 ether)                        // Now the string is updated only when 1 ether is sent. Anything else and the 'else' executes
            myString = _myString;
        else{
            // payable(msg.sender).transfer(msg.value);             // This is one way of transfering eth
            bool sent = payable(msg.sender).send(msg.value);        //  Using the 'send' function instead. It returns 'true' or 'false'
            require(sent , "Only accepting 1 ether!");              // 'require' is more or less like an 'or'(as I understand)
        }
    }
}