//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract ExampleConstructor {

    address public myAddress;
    uint public balance;

    constructor (address _someAddress) {
        myAddress = _someAddress;
    }

    function getBalance () public {
        balance = myAddress.balance;
    }
}