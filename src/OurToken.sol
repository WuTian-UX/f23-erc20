// Layout of Contract:
// version
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// view & pure functions

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import {ERC20} from '@openzeppelin/contracts/token/ERC20/ERC20.sol';
contract OurToken is ERC20 {
    constructor(uint256 initCount) ERC20('OurToken', 'OTK') {
        _mint(msg.sender, initCount);
    }
}
