// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.6.12;

import "./SystemCore/System3.sol";
import "./SystemCore/Registry.sol";

import "./SystemComponents/Contract3.sol";

contract Network3 is System3, Registry {
    // No constructor
    constructor() public {}

    function __Network_init() public initializer {
        Registry.__Registry_init();
    }

    function conversion() public view returns (string memory) {
        return MyContract3(addressOf(System3.Contract3)).getString();
    }
}
