// SPDX-License-Identifier: MIT

import {Script} from "forge-std/Script.sol";
import {console2} from "forge-std/console2.sol";
import {Vm} from "../src/Vm.sol";

pragma solidity ^0.8.26;

contract DeployVm is Script {
    function run() external returns (Vm) {
        vm.startBroadcast();
        Vm constract = new Vm();
        console2.log(" contract address", address(constract));
        vm.stopBroadcast();
        return constract;
    }
}