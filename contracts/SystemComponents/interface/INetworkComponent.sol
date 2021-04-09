// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.6.12;

import "../_RegistryClient.sol";

contract INetworkComponent is RegistryClient {
    bytes32 internal constant Contract1 = "Contract1";
    bytes32 internal constant Contract2 = "Contract2";

    constructor(address networkAddress) public RegistryClient(networkAddress) {}
}
