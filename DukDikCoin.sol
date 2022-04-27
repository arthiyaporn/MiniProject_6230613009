// SPDX-License-Identifier: MIT 
//contracts/GameItems.sol
pragma solidity ^0.8.7; 

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DukDikCoin is ERC20 {
    constructor() ERC20("DukDikCoin","DK"){
        _mint(msg.sender, 1000*10 ** 18);
    }
}
