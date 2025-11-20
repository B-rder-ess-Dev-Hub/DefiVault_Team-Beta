// SPDX-License-Identifier: MIT

import {Script} from "forge-std/Script.sol";
import {console2} from "forge-std/console2.sol";
import {StdConstants} from "../src/StdConstants.sol";

pragma solidity ^0.8.26;

contract DeployStdConstants is Script {
    function run() external returns (StdConstants) {
        vm.startBroadcast();
        StdConstants constract = new StdConstants();
        console2.log(" contract address", address(constract));
        vm.stopBroadcast();
        return constract;
    }
}