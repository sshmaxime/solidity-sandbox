// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.6.12;

import "./interface/INetworkComponent.sol";

contract MyContract3 is INetworkComponent {
    bytes32 internal constant ContractName = "Contract3";

    constructor(address networkAddress) public INetworkComponent(networkAddress) {}

    function getString() public pure returns (string memory) {
        return "hello world 3";
    }
}
