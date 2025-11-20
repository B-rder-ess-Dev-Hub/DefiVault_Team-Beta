// SPDX-License-Identifier: MIT

import {Test} from "forge-std/Test.sol";
import {StdConstants} from "../src/StdConstants.sol";
import {DeployStdConstants} from "../script/DeployStdConstants.s.sol";

pragma solidity ^0.8.26;

contract StdConstantsTest is Test {
    StdConstants public contractInstance;
    DeployStdConstants public deployer;
    function setUp() public {
        deployer = new DeployStdConstants();
        contractInstance = deployer.run();

    }

    function testExample() public {
        // Add your test logic here
    }
}