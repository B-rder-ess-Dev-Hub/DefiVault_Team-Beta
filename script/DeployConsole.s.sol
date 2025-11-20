// SPDX-License-Identifier: MIT

import {Script} from "forge-std/Script.sol";
import {console2} from "forge-std/console2.sol";
import {Console} from "../src/Console.sol";

pragma solidity ^0.8.26;

contract DeployConsole is Script {
    function run() external returns (Console) {
        vm.startBroadcast();
        Console constract = new Console();
        console2.log(" contract address", address(constract));
        vm.stopBroadcast();
        return constract;
    }
}