// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.26;

import {Script, console} from "forge-std/Script.sol";
import {YokaiChainDescriptor} from "src/YokaiChainDescriptor.sol";

contract DeployYokaiChainDescriptor is Script {
    function run() public returns (YokaiChainDescriptor) {
        vm.startBroadcast();
        YokaiChainDescriptor descriptor = new YokaiChainDescriptor();
        console.log("Deployed YokaiChainDescriptor at address: {}", address(descriptor));
        vm.stopBroadcast();
        return descriptor;
    }
}
