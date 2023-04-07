//This contract will to be deployed onto the Sepolia Test network

//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract SampleDeployement{
    string public myString;

    function upadteString (string memory _myString) public{
        myString = _myString;
    }
}