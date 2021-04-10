// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.6.12;

import "./RegistryDirectory.sol";
import "./Registry.sol";

contract NetworkComponent is RegistryDirectory {
    Registry public registry;

    constructor(address networkAddress) public {
        registry = Registry(networkAddress);
    }

    //
    function addressOf(bytes32 _contractName) public view returns (address) {
        return registry.addressOf(_contractName);
    }
}
