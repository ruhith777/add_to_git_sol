// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract SaleContract {
    //users to send ethers to contract 
    //and receive amount of new tokens
    //contract should manage users balance,total tokens
    
    mapping(address => uint) public balances;
    uint public totalTokensSupplied;
    

    function buyTokens()external payable {
        uint amount = msg.value;
        balances[msg.sender] += amount;
        totalTokensSupplied++;
    }
    
}
