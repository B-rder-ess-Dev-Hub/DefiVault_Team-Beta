// SPDX-License-Identifier: MIT

import {Test} from "forge-std/Test.sol";
import {Vm} from "../src/Vm.sol";
import {DeployVm} from "../script/DeployVm.s.sol";

pragma solidity ^0.8.26;

contract VmTest is Test {
    Vm public contractInstance;
    DeployVm public deployer;
    function setUp() public {
        deployer = new DeployVm();
        contractInstance = deployer.run();

    }

    function testExample() public {
        // Add your test logic here
    }
}