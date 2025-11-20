// SPDX-License-Identifier: MIT

import {Script} from "forge-std/Script.sol";
import {console2} from "forge-std/console2.sol";
import {StdInvariant} from "../src/StdInvariant.sol";

pragma solidity ^0.8.26;

contract DeployStdInvariant is Script {
    function run() external returns (StdInvariant) {
        vm.startBroadcast();
        StdInvariant constract = new StdInvariant();
        console2.log(" contract address", address(constract));
        vm.stopBroadcast();
        return constract;
    }
}