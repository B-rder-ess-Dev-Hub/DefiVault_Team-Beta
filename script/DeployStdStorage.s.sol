// SPDX-License-Identifier: MIT

import {Script} from "forge-std/Script.sol";
import {console2} from "forge-std/console2.sol";
import {StdStorage} from "../src/StdStorage.sol";

pragma solidity ^0.8.26;

contract DeployStdStorage is Script {
    function run() external returns (StdStorage) {
        vm.startBroadcast();
        StdStorage constract = new StdStorage();
        console2.log(" contract address", address(constract));
        vm.stopBroadcast();
        return constract;
    }
}