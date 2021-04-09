// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.6.12;

import "@openzeppelin/contracts/access/Ownable.sol";

import "./../SystemCore/Registry.sol";

contract RegistryClient {
    Registry public registry;

    constructor(address registryAddress) public {
        registry = Registry(registryAddress);
    }

    //
    function addressOf(bytes32 _contractName) public view returns (address) {
        return registry.addressOf(_contractName);
    }
}
