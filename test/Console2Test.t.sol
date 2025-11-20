// SPDX-License-Identifier: MIT

import {Test} from "forge-std/Test.sol";
import {Console2} from "../src/Console2.sol";
import {DeployConsole2} from "../script/DeployConsole2.s.sol";

pragma solidity ^0.8.26;

contract Console2Test is Test {
    Console2 public contractInstance;
    DeployConsole2 public deployer;
    function setUp() public {
        deployer = new DeployConsole2();
        contractInstance = deployer.run();

    }

    function testExample() public {
        // Add your test logic here
    }
}