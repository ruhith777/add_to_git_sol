// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.24;

contract Crowdfunding {
    //users can create campaigns,donate to campings
    //users can withdraw funds once goal is reached
    struct campaign {
        uint campId;
        string name;
        uint donate_fund;
        uint target ;
    }

    campaign[] public campaigns;
    mapping(address => uint) public owner;

    function addCampaign(string memory name)external {
        campaigns.push(campaign(campaigns.length + 1,name,0,1000));
    }

    function donate(uint campId)external payable {
        uint amount = msg.value;
        campaigns[campId - 1].donate_fund += amount;
    }

    function withdraw(uint campId) external payable {
        require(campaigns[campId - 1].target <  campaigns[campId - 1].donate_fund,"target not reached");
         campaigns[campId - 1].donate_fund -= 0;
         //send to owner 
         owner[msg.sender] =  campaigns[campId - 1].donate_fund;
         campaigns[campId - 1].donate_fund = 0;

    }
}