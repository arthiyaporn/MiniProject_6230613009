// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0; 
contract Payment {

    address payable public owner;
    uint public releaseTime;


    constructor(address payable _owner){
        owner = _owner;
    }

    function setReleaseTime(uint _seconds)external{
        releaseTime = block.timestamp + _seconds;
    } 

    function release() public {
        require(block.timestamp >= releaseTime ,"Wait");
        uint amount = address(this).balance;
        require(amount > 0,"Not enough");
        owner.transfer(amount);
    }

    function transfer(address payable _to, uint _amount) public {
        (bool success, ) = _to.call{value: _amount}("");
        require(success, "Failed to send");
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

}