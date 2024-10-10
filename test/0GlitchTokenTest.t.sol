// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.26;

import {Test} from "../lib/forge-std/src/Test.sol";
import "../src/0glitchToken.sol";
import "../script/DeployOGlitchToken.s.sol";

contract OGlitchTokenTest is Test {
    OGlitchToken public ogToken;
    DeployOGlitchToken public deploy;

    address bob = makeAddr("bob");
    address alice = makeAddr("alice");

    uint256 public constant STARTING_BALANCE = 100 ether;

    function setUp() public {
        deploy = new DeployOGlitchToken();
        ogToken = deploy.run();

        vm.prank(msg.sender);
        ogToken.transfer(bob, STARTING_BALANCE);
    }

    function testbobBalance() public view {
        assertEq(STARTING_BALANCE, ogToken.balanceOf(bob));
    }

    function testAllowanceWorks() public {
        uint256 initialAllowance = 1000;

        //bob approves alice to spend toke on his behalf
        vm.prank(bob);
        ogToken.approve(alice, initialAllowance);

        uint256 transferAmount = 500;

        vm.prank(alice);
        ogToken.transferFrom(bob, alice, transferAmount);

        assertEq(ogToken.balanceOf(alice), transferAmount);
        assertEq(ogToken.balanceOf(bob), STARTING_BALANCE - transferAmount);
    }
}
