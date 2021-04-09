// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.6.12;

import "./interface/INetworkComponent.sol";

contract MyContract1 is INetworkComponent {
    bytes32 internal constant ContractName = "Contract1";

    constructor(address networkAddress) public INetworkComponent(networkAddress) {}

    function getString() public pure returns (string memory) {
        return "hello world";
    }
}
