// SPDX-License-Identifier: MIT

import {Test} from "forge-std/Test.sol";
import {StdUtils} from "../src/StdUtils.sol";
import {DeployStdUtils} from "../script/DeployStdUtils.s.sol";

pragma solidity ^0.8.26;

contract StdUtilsTest is Test {
    StdUtils public contractInstance;
    DeployStdUtils public deployer;
    function setUp() public {
        deployer = new DeployStdUtils();
        contractInstance = deployer.run();

    }

    function testExample() public {
        // Add your test logic here
    }
}