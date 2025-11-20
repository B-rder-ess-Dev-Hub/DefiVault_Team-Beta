// SPDX-License-Identifier: MIT

import {Test} from "forge-std/Test.sol";
import {Console} from "../src/Console.sol";
import {DeployConsole} from "../script/DeployConsole.s.sol";

pragma solidity ^0.8.26;

contract ConsoleTest is Test {
    Console public contractInstance;
    DeployConsole public deployer;
    function setUp() public {
        deployer = new DeployConsole();
        contractInstance = deployer.run();

    }

    function testExample() public {
        // Add your test logic here
    }
}