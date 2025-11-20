// SPDX-License-Identifier: MIT

import {Script} from "forge-std/Script.sol";
import {console2} from "forge-std/console2.sol";
import {StdError} from "../src/StdError.sol";

pragma solidity ^0.8.26;

contract DeployStdError is Script {
    function run() external returns (StdError) {
        vm.startBroadcast();
        StdError constract = new StdError();
        console2.log(" contract address", address(constract));
        vm.stopBroadcast();
        return constract;
    }
}