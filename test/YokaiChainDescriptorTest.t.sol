// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.26;

import {Test, console} from "forge-std/Test.sol";
import {YokaiChainDescriptor} from "src/YokaiChainDescriptor.sol";
import {DeployYokaiChainDescriptor} from "script/DeployYokaiChainDescriptor.s.sol";

contract YokaiChainDescriptorTest is Test {
    DeployYokaiChainDescriptor deployDescriptor;

    YokaiChainDescriptor descriptor;

    function setUp() public {
        deployDescriptor = new DeployYokaiChainDescriptor();
        descriptor = deployDescriptor.run();
    }

    function test_tokenURI() public {}
}
