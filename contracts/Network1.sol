// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.6.12;

import "./SystemCore/System1.sol";
import "./SystemCore/Registry.sol";

import "./SystemComponents/Contract1.sol";

contract Network1 is System1, Registry {
    // No constructor
    constructor() public {}

    function __Network_init() public initializer {
        Registry.__Registry_init();
    }

    function conversion() public view returns (string memory) {
        return MyContract1(addressOf(System1.Contract1)).getString();
    }
}
