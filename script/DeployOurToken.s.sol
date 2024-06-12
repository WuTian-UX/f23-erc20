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
import {Script} from 'forge-std/Script.sol';
import {OurToken} from '../src/OurToken.sol';
contract DeployOurToken is Script {
    uint256 public constant INITCOUNT = 1000;
    function run() public {
        vm.startBroadcast();
        new OurToken(INITCOUNT);
        vm.stopBroadcast();
        // token.transfer(msg.sender, 1000);
    }
}
