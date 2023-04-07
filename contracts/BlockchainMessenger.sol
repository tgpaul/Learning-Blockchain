//Goal of this contract:-
//  A contract that will save a message on the blockchain, readable to everyone
//  but writeable only to one person that deployed the contract.
//  We shall also count how many times the message was updated.

//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract blockchainMessenger {
    address owner;
    //I could just give owner=msg.sender. But gonna do that inside the constructor for now.
    uint changeCounter;
    string theMessage;

    constructor () {
        owner = msg.sender;
    }

    function updatingTheMessage (string memory _newMessage) public {
        //if the person calling this function(i.e, msg.sender) is the person who deployed this contract(i.e, the 'msg.sender' inside the constructor)
        if(msg.sender == owner){
            theMessage = _newMessage;
            changeCounter++;
        }
    }

    //function to view the values. I could have just declared the variables 'public', and then used the default getter functions.
    //but that no fun :)
    function viewMessage() public view returns(string memory, uint){
        return(theMessage,changeCounter);
    }
}

//Did not do error handling here. If another account tries to update the message, then the call goes through, but the values do not change