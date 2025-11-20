// SPDX-License-Identifier: MIT

import {Test} from "forge-std/Test.sol";
import {StdToml} from "../src/StdToml.sol";
import {DeployStdToml} from "../script/DeployStdToml.s.sol";

pragma solidity ^0.8.26;

contract StdTomlTest is Test {
    StdToml public contractInstance;
    DeployStdToml public deployer;
    function setUp() public {
        deployer = new DeployStdToml();
        contractInstance = deployer.run();

    }

    function testExample() public {
        // Add your test logic here
    }
}