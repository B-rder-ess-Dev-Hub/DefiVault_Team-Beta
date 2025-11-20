// SPDX-License-Identifier: MIT

import {Test} from "forge-std/Test.sol";
import {StdStorage} from "../src/StdStorage.sol";
import {DeployStdStorage} from "../script/DeployStdStorage.s.sol";

pragma solidity ^0.8.26;

contract StdStorageTest is Test {
    StdStorage public contractInstance;
    DeployStdStorage public deployer;
    function setUp() public {
        deployer = new DeployStdStorage();
        contractInstance = deployer.run();

    }

    function testExample() public {
        // Add your test logic here
    }
}