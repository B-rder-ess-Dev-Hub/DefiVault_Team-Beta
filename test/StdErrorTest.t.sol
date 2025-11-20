// SPDX-License-Identifier: MIT

import {Test} from "forge-std/Test.sol";
import {StdError} from "../src/StdError.sol";
import {DeployStdError} from "../script/DeployStdError.s.sol";

pragma solidity ^0.8.26;

contract StdErrorTest is Test {
    StdError public contractInstance;
    DeployStdError public deployer;
    function setUp() public {
        deployer = new DeployStdError();
        contractInstance = deployer.run();

    }

    function testExample() public {
        // Add your test logic here
    }
}