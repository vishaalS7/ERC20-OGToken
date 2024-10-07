// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import "../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract OGlitchToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("OGlitchToken", "OG") {
        _mint(msg.sender, initialSupply);
    }
}
