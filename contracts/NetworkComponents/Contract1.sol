// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.6.12;

import "./../SystemCore/NetworkComponent.sol";

contract MyContract1 is NetworkComponent {
    bytes32 internal constant ContractName = "Contract1";

    constructor(address networkAddress) public NetworkComponent(networkAddress) {}

    function getString() public pure returns (string memory) {
        return "hello world";
    }
}
