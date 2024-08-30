// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.24;
contract Voting {
    //Add  parties in array and a function to add party in parties array
    //Users can propose options and vote on them
    //each vote being a transaction on the blockchain
    //contract counts the votes and can determine a winner
    struct party {
        string partyName;
        uint partyId;
        uint totalCount;
    }
    party[] public parties;

    function addParty(string memory name)external {
        parties.push(party(name,parties.length+1,0));
    }
    
    function voting(uint partyID)external {
        parties[partyID-1].totalCount++;
    }

    function winner() external view returns(string memory){
        uint max;
        uint winnerID;
        for(uint i = 0;i < parties.length;i++) {
            if(parties[i].totalCount > max) {
                max = parties[i].totalCount; 
                winnerID = i + 1;
            }
        }
        return parties[winnerID - 1].partyName;
    }
}