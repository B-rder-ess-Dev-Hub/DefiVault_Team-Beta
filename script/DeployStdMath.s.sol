// SPDX-License-Identifier: MIT

import {Script} from "forge-std/Script.sol";
import {console2} from "forge-std/console2.sol";
import {StdMath} from "../src/StdMath.sol";

pragma solidity ^0.8.26;

contract DeployStdMath is Script {
    function run() external returns (StdMath) {
        vm.startBroadcast();
        StdMath constract = new StdMath();
        console2.log(" contract address", address(constract));
        vm.stopBroadcast();
        return constract;
    }
}