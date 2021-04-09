import { ethers, upgrades } from 'hardhat';

import { Network2, Network2__factory, MyContract2__factory, Network1__factory } from '../typechain';

const CONTRACT2 = ethers.utils.formatBytes32String('Contract2');

async function main() {
    const accounts = await ethers.getSigners();

    // Factories
    let network1F = (await ethers.getContractFactory('Network2')) as Network1__factory;

    let network2F = (await ethers.getContractFactory('Network2')) as Network2__factory;
    let myContract2F = (await ethers.getContractFactory('MyContract2')) as MyContract2__factory;

    // Deploy network
    let network2 = (await upgrades.upgradeProxy('0x5FC8d32690cc91D4c39d9d3abcBD16989F875707', network2F)) as Network2;

    let myContract2 = await myContract2F.deploy(network2.address);

    await network2.registerAddress(CONTRACT2, myContract2.address);

    console.log(await network2.conversion());
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
