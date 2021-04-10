# solidity-sandbox

## Basics

A proxy is consisting of 3 contracts:

-   Admin Contract
-   Proxy Contract
-   Implementation Contract

##### Proxy Contract

The Proxy Contract is a "gateway" to an implementation contract. It's a contract that delegates every call to its implementation contract.

It also have some functions to upgrade the implementation contracts. By default, the owner of the Proxy Contract is the Admin Contract.

##### Admin Contract

The Admin Contract is the owner of the Proxy Contract (i.e the only one that is allowed to upgrade the implementation contract address). By default, the owner of the Admin Contract is the initial proxy deployer.

##### Implementation Contract

The Implementation Contract can be also defined as a logic contract. Here the logic contract is `Network.sol`.

> Note a very important thing. The state is and should be (it's the whole point of the proxy) in Proxy Contract but the logic is in the Implementation Contract. Implementation Contract is in itself not initialized.

## Network

Here, `Network.sol` is the entry point of the network and also its registry. It's behind a proxy. It will be named Network.

Network is meant to be the entrypoint to the system's main functionnalities. It imports the Registry.

The Registry is keeping addresses of each contracts in our network. It imports the NetworkRegistryDirectory.

NetworkRegistryDirectory is simply keeping track of every addresses of our NetworkComponent as a set of constants.

NetworkComponent serve as base contract for any contract that plays a part on the Network. It needs the Network address to be provided. It provides an `addressOf` methods and any other methods that any NetworkComponents should have.

## Workflow

The workflow would be as follow.

-> Deploy the proxy (Proxy + Admin + Network (Implementation Contract))

-> Deploy a NetworkComponent and pass it the proxy address when deploying.

## Deploy & Upgrade in scripts

> Deploy & Upgrade for test are in the test file and are easy enough to understand without explanation.

In `./scripts/` there is two scripts, `deploy` and `upgrade`.

Start the hardhat test chain: `yarn hhnode`

Deploy the proxy and other: `yarn test-deploy` and get the proxy address given by the script.

Upgrade the implementation contract by replacing PROXY_ADDRESS with the address you get in the previous step in `./scripts/upgrade.ts`.

Then upgrade the proxy with the new implementation contract: `yarn test-upgrade`.

Done ✨✨✨
