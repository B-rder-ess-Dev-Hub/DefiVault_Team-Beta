// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "@contract/SimpleToken.sol";
import "@contract/TokenVault.sol";

contract Deploy is Script {
    function run() external {
        // start broadcasting to blockchain
        vm.startBroadcast();

        // deploy the token first
        SimpleToken token = new SimpleToken();

        // deploy the vault and pass the token address
        TokenVault vault = new TokenVault(address(token));

        // print the addresses
        console.log("SimpleToken deployed to:", address(token));
        console.log("TokenVault deployed to:", address(vault));

        vm.stopBroadcast();
    }
}