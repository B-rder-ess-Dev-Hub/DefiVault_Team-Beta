// SPDX-License-Identifier: MIT

import {Script} from "forge-std/Script.sol";
import {console2} from "forge-std/console2.sol";
import {StdStyle} from "../src/StdStyle.sol";

pragma solidity ^0.8.26;

contract DeployStdStyle is Script {
    function run() external returns (StdStyle) {
        vm.startBroadcast();
        StdStyle constract = new StdStyle();
        console2.log(" contract address", address(constract));
        vm.stopBroadcast();
        return constract;
    }
}