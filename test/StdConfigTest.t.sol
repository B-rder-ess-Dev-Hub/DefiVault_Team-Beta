// SPDX-License-Identifier: MIT

import {Test} from "forge-std/Test.sol";
import {StdConfig} from "../src/StdConfig.sol";
import {DeployStdConfig} from "../script/DeployStdConfig.s.sol";

pragma solidity ^0.8.26;

contract StdConfigTest is Test {
    StdConfig public contractInstance;
    DeployStdConfig public deployer;
    function setUp() public {
        deployer = new DeployStdConfig();
        contractInstance = deployer.run();

    }

    function testExample() public {
        // Add your test logic here
    }
}