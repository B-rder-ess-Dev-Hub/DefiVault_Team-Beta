// SPDX-License-Identifier: MIT

import {Script} from "forge-std/Script.sol";
import {console2} from "forge-std/console2.sol";
import {StdUtils} from "../src/StdUtils.sol";

pragma solidity ^0.8.26;

contract DeployStdUtils is Script {
    function run() external returns (StdUtils) {
        vm.startBroadcast();
        StdUtils constract = new StdUtils();
        console2.log(" contract address", address(constract));
        vm.stopBroadcast();
        return constract;
    }
}