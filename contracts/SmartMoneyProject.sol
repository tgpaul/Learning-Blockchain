/*
This contract has to allow:-
1. Deposits rom any address
2. Transfer all it's balance to the sender address
3. Transfer all it's balance to a specified address
*/

//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract SmartMoneyProject{
    uint public balanceReceived;

    function deposit() public payable {                         // Deposits the money into the smart contract.
        balanceReceived += msg.value;                           // This line is just to display that value for viewing.
    }// I believe that theoretically, just a receive function is neccesary instead of this.

    function getContractBalance() public view returns(uint) {   // Contract balance getter function.
        return address(this).balance;
    }

    function withdrawAll() public {                             // Transfer all the balance in this SM to the message ender.
        // address payable to = payable(msg.sender);
        // to.transfer(getContractBalance());
        // Single line for the above code:-
        payable(msg.sender).transfer(getContractBalance());
    }

    function withdrawTo(address payable to) public {
        to.transfer(getContractBalance());
    }
}