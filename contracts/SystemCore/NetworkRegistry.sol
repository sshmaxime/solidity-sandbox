// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.6.12;

import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

import "./NetworkRegistryDirectory.sol";
import "./../Utils/Utils.sol";

contract NetworkRegistry is Utils, Initializable, OwnableUpgradeable, NetworkRegistryDirectory {
    struct RegistryItem {
        address contractAddress;
        uint256 name;
    }

    mapping(bytes32 => RegistryItem) private items;
    bytes32[] private contractNames;

    // No constructor
    constructor() public {}

    function __Registry_init() public initializer {
        OwnableUpgradeable.__Ownable_init();
    }

    //
    function addressOf(bytes32 _contractName) public view returns (address) {
        return items[_contractName].contractAddress;
    }

    function registerAddress(bytes32 _contractName, address _contractAddress)
        public
        onlyOwner
        validAddress(_contractAddress)
        validBytes32(_contractName)
    {
        // check if any change is needed
        address currentAddress = items[_contractName].contractAddress;
        if (_contractAddress == currentAddress) return;

        if (currentAddress == address(0)) {
            // update the item's index in the list
            items[_contractName].name = contractNames.length;

            // add the contract name to the name list
            contractNames.push(_contractName);
        }

        // update the address in the registry
        items[_contractName].contractAddress = _contractAddress;
    }
}
