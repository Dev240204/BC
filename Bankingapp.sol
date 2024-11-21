// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Bankingapp
{
    uint public bal;
    constructor(){
        bal=500;
    }
    function credit(uint amt) public {
        bal = bal + amt;
    }
    function debit(uint amt) public {
        bal = bal-amt;
    }
    function checkbal() public view returns(uint){
        return bal;
    }

}