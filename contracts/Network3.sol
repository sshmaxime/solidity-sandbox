// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.6.12;

import "./SystemCore/RegistryDirectory.sol";
import "./SystemCore/Registry.sol";

import "./NetworkComponents/Contract3.sol";

contract Network3 is RegistryDirectory, Registry {
    // No constructor
    constructor() public {}

    function __Network_init() public initializer {
        Registry.__Registry_init();
    }

    function conversion() public view returns (string memory) {
        return MyContract3(addressOf(RegistryDirectory.Contract3)).getString();
    }
}
