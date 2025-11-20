// SPDX-License-Identifier: MIT

import {Script} from "forge-std/Script.sol";
import {console2} from "forge-std/console2.sol";
import {StdToml} from "../src/StdToml.sol";

pragma solidity ^0.8.26;

contract DeployStdToml is Script {
    function run() external returns (StdToml) {
        vm.startBroadcast();
        StdToml constract = new StdToml();
        console2.log(" contract address", address(constract));
        vm.stopBroadcast();
        return constract;
    }
}