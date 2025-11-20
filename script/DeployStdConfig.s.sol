// SPDX-License-Identifier: MIT

import {Script} from "forge-std/Script.sol";
import {console2} from "forge-std/console2.sol";
import {StdConfig} from "../src/StdConfig.sol";

pragma solidity ^0.8.26;

contract DeployStdConfig is Script {
    function run() external returns (StdConfig) {
        vm.startBroadcast();
        StdConfig constract = new StdConfig();
        console2.log(" contract address", address(constract));
        vm.stopBroadcast();
        return constract;
    }
}