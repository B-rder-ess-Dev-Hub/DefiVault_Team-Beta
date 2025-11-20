// SPDX-License-Identifier: MIT

import {Test} from "forge-std/Test.sol";
import {StdInvariant} from "../src/StdInvariant.sol";
import {DeployStdInvariant} from "../script/DeployStdInvariant.s.sol";

pragma solidity ^0.8.26;

contract StdInvariantTest is Test {
    StdInvariant public contractInstance;
    DeployStdInvariant public deployer;
    function setUp() public {
        deployer = new DeployStdInvariant();
        contractInstance = deployer.run();

    }

    function testExample() public {
        // Add your test logic here
    }
}