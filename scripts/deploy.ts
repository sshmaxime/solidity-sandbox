import { ethers, upgrades } from 'hardhat';

import { Network1, Network1__factory, MyContract1__factory } from '../typechain';

const CONTRACT1 = ethers.utils.formatBytes32String('Contract1');

async function main() {
    // Factories
    let network1F = (await ethers.getContractFactory('Network1')) as Network1__factory;
    let myContract1F = (await ethers.getContractFactory('MyContract1')) as MyContract1__factory;

    // Deploy proxy, implementation contract and inititialize it
    let network1 = (await upgrades.deployProxy(network1F, { initializer: '__Network_init' })) as Network1;

    let myContract1 = await myContract1F.deploy(network1.address);

    await network1.registerAddress(CONTRACT1, myContract1.address);

    console.log('Deploy proxy at: ' + network1.address);
    console.log(await network1.conversion());
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
