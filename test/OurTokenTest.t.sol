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
import {Test, console} from 'forge-std/Test.sol';
import {OurToken} from '../src/OurToken.sol';
import {DeployOurToken} from '../script/DeployOurToken.s.sol';

contract OurTokenTest is Test {
    // 币相关
    OurToken public ourToken;
    DeployOurToken public deployer;

    // 模拟用户
    address bob = makeAddr('bob');
    address alice = makeAddr('alice');

    function setUp() public {
        // 部署币合约
        deployer = new DeployOurToken();
        ourToken = deployer.run();
    }

    // 测试合约向外转账
    function testTransforUser() public {
        vm.prank(msg.sender);
        ourToken.transfer(bob, 100);
        console.log('bob balance:', ourToken.balanceOf(bob));
    }

    // 测试授权
    function testAllowanceBobToAlice() public {
        vm.prank(msg.sender);
        ourToken.transfer(bob, 100);
        //
        vm.prank(bob);
        ourToken.approve(alice, 50);
        uint256 allowance = ourToken.allowance(bob, alice);
        console.log('allowance:', allowance);
        console.log('bob balance2:', ourToken.balanceOf(bob));
        //
        vm.prank(alice);
        ourToken.transferFrom(bob, alice, 50);
        console.log('alice balance:', ourToken.balanceOf(alice));
    }
}
