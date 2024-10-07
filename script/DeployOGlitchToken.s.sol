// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import {Script} from "../lib/forge-std/src/Script.sol";
import {OGlitchToken} from "../src/0glitchToken.sol";

contract DeployOGlitchToken is Script {
    uint256 public constant INITIAL_SUPPLY = 1000 ether;

    function run() external returns (OGlitchToken) {
        vm.startBroadcast();
        OGlitchToken OG = new OGlitchToken(INITIAL_SUPPLY);
        vm.stopBroadcast();

        return OG;
    }
}
