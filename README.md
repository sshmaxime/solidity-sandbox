# solidity-sandbox

## Basics

A is consisting of 3 contracts:

-   Admin Contract
-   Proxy Contract
-   Implementation Contract

##### Proxy Contract

The Proxy Contract is a "gateway" to the implementation contracts. It's basically a contract delegating every call to the implementation contracts.

It also have some functions to upgrade the implementation contracts. By default, the owner of the Proxy Contract is the Admin Contract.

##### Admin Contract

The Admin Contract is the owner of the Proxy Contract (i.e the only one that is allowed to upgrade the implementation contract). By default, the owner of the Admin Contract is the initial proxy deployer.

##### Implementation Contract

The Implementation Contract can be also defined as a logic contract. Here the logic contract is `Network.sol`.

> Note a very important thing. The state is and should be (it's the whole point of the proxy) in Proxy Contract but the logic is in the Implementation Contract. Implementation Contract is in itself not initialized.

## Network

Here, `Network.sol` is the entry point of the network and also its registry. It's behind a proxy. It will be named Network and "NetworkAddress" is the address of the proxy.

Network imports the Registry and RegistryDirectory contracts.

Network is meant to be the entrypoint to the system's main functionnalities.

Registry is keeping addresses of each contracts in our network.

RegistryDirectory is simply keeping track of every addresses of our NetworkComponent as a set of constants.

NetworkComponent is any contract that plays a part on the Network. NetworkComponent constructor needs the `NetworkAddress` (as it is also the Registry).

### Workflow

The workflow would be as follow.

-> Deploy the proxy (Proxy + Admin + Network (Implementation Contract))

-> Deploy a NetworkComponent with the `NetworkAddress`.

## Tests
