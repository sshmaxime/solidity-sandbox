// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.6.12;

import "./SystemCore/System2.sol";
import "./SystemCore/Registry.sol";

import "./SystemComponents/Contract2.sol";

contract Network2 is System2, Registry {
    // No constructor
    constructor() public {}

    function __Network_init() public initializer {
        Registry.__Registry_init();
    }

    function conversion() public view returns (string memory) {
        return MyContract2(addressOf(System2.Contract2)).getString();
    }
}
