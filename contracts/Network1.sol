// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.6.12;

import "./SystemCore/RegistryDirectory.sol";
import "./SystemCore/Registry.sol";

import "./NetworkComponents/Contract1.sol";

contract Network1 is RegistryDirectory, Registry {
    // No constructor
    constructor() public {}

    function __Network_init() public initializer {
        Registry.__Registry_init();
    }

    function conversion() public view returns (string memory) {
        return MyContract1(addressOf(RegistryDirectory.Contract1)).getString();
    }
}
