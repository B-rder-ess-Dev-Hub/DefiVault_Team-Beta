// SPDX-License-Identifier: MIT

import {Script} from "forge-std/Script.sol";
import {console2} from "forge-std/console2.sol";
import {Safeconsole} from "../src/Safeconsole.sol";

pragma solidity ^0.8.26;

contract DeploySafeconsole is Script {
    function run() external returns (Safeconsole) {
        vm.startBroadcast();
        Safeconsole constract = new Safeconsole();
        console2.log(" contract address", address(constract));
        vm.stopBroadcast();
        return constract;
    }
}