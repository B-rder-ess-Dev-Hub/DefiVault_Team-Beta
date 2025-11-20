// SPDX-License-Identifier: MIT

import {Test} from "forge-std/Test.sol";
import {StdStyle} from "../src/StdStyle.sol";
import {DeployStdStyle} from "../script/DeployStdStyle.s.sol";

pragma solidity ^0.8.26;

contract StdStyleTest is Test {
    StdStyle public contractInstance;
    DeployStdStyle public deployer;
    function setUp() public {
        deployer = new DeployStdStyle();
        contractInstance = deployer.run();

    }

    function testExample() public {
        // Add your test logic here
    }
}