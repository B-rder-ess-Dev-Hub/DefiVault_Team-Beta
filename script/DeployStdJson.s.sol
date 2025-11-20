// SPDX-License-Identifier: MIT

import {Script} from "forge-std/Script.sol";
import {console2} from "forge-std/console2.sol";
import {StdJson} from "../src/StdJson.sol";

pragma solidity ^0.8.26;

contract DeployStdJson is Script {
    function run() external returns (StdJson) {
        vm.startBroadcast();
        StdJson constract = new StdJson();
        console2.log(" contract address", address(constract));
        vm.stopBroadcast();
        return constract;
    }
}