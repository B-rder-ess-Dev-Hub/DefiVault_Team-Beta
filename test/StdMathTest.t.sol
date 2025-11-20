// SPDX-License-Identifier: MIT

import {Test} from "forge-std/Test.sol";
import {StdMath} from "../src/StdMath.sol";
import {DeployStdMath} from "../script/DeployStdMath.s.sol";

pragma solidity ^0.8.26;

contract StdMathTest is Test {
    StdMath public contractInstance;
    DeployStdMath public deployer;
    function setUp() public {
        deployer = new DeployStdMath();
        contractInstance = deployer.run();

    }

    function testExample() public {
        // Add your test logic here
    }
}