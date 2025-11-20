// SPDX-License-Identifier: MIT

import {Test} from "forge-std/Test.sol";
import {Safeconsole} from "../src/Safeconsole.sol";
import {DeploySafeconsole} from "../script/DeploySafeconsole.s.sol";

pragma solidity ^0.8.26;

contract SafeconsoleTest is Test {
    Safeconsole public contractInstance;
    DeploySafeconsole public deployer;
    function setUp() public {
        deployer = new DeploySafeconsole();
        contractInstance = deployer.run();

    }

    function testExample() public {
        // Add your test logic here
    }
}