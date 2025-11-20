// SPDX-License-Identifier: MIT

import {Script} from "forge-std/Script.sol";
import {console2} from "forge-std/console2.sol";
import {Console2} from "../src/Console2.sol";

pragma solidity ^0.8.26;

contract DeployConsole2 is Script {
    function run() external returns (Console2) {
        vm.startBroadcast();
        Console2 constract = new Console2();
        console2.log(" contract address", address(constract));
        vm.stopBroadcast();
        return constract;
    }
}