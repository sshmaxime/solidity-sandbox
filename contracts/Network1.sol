// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.6.12;

// import "./SystemCore/RegistryDirectory.sol";
import "./SystemCore/NetworkRegistry.sol";

import "./NetworkComponents/Contract1.sol";

contract Network1 is NetworkRegistry {
    // No constructor
    constructor() public {}

    function __Network_init() public initializer {
        NetworkRegistry.__Registry_init();
    }

    function conversion() public view returns (string memory) {
        return MyContract1(addressOf(NetworkRegistryDirectory.Contract1)).getString();
    }
}
