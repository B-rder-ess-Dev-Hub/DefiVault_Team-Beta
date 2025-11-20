// SPDX-License-Identifier: MIT

import {Test} from "forge-std/Test.sol";
import {StdJson} from "../src/StdJson.sol";
import {DeployStdJson} from "../script/DeployStdJson.s.sol";

pragma solidity ^0.8.26;

contract StdJsonTest is Test {
    StdJson public contractInstance;
    DeployStdJson public deployer;
    function setUp() public {
        deployer = new DeployStdJson();
        contractInstance = deployer.run();

    }

    function testExample() public {
        // Add your test logic here
    }
}