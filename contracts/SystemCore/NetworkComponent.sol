// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.6.12;

import "./NetworkRegistryDirectory.sol";
import "./NetworkRegistry.sol";

contract NetworkComponent is NetworkRegistryDirectory {
    NetworkRegistry public registry;

    constructor(address networkAddress) public {
        registry = NetworkRegistry(networkAddress);
    }

    //
    function addressOf(bytes32 _contractName) public view returns (address) {
        return registry.addressOf(_contractName);
    }
}
