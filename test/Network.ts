import { expect } from 'chai';
import { ethers, upgrades } from 'hardhat';

import { SignerWithAddress } from '@nomiclabs/hardhat-ethers/signers';

import {
    Network1,
    Network1__factory,
    Network2,
    Network2__factory,
    Network3,
    Network3__factory,
    MyContract1__factory,
    MyContract1,
    MyContract2,
    MyContract2__factory,
    MyContract3,
    MyContract3__factory
} from '../typechain';

let accounts: SignerWithAddress[];

let network1F: Network1__factory;
let network2F: Network2__factory;
let network3F: Network3__factory;
//
let myContract1F: MyContract1__factory;
let myContract2F: MyContract2__factory;
let myContract3F: MyContract3__factory;
//
let network1: Network1;
let network2: Network2;
let network3: Network3;
//
let myContract1: MyContract1;
let myContract2: MyContract2;
let myContract3: MyContract3;

const CONTRACT1 = ethers.utils.formatBytes32String('Contract1');
const CONTRACT2 = ethers.utils.formatBytes32String('Contract2');
const CONTRACT3 = ethers.utils.formatBytes32String('Contract3');

describe('network', () => {
    before(async () => {
        accounts = await ethers.getSigners();

        // Factories
        network1F = (await ethers.getContractFactory('Network1')) as Network1__factory;
        network2F = (await ethers.getContractFactory('Network2')) as Network2__factory;
        network3F = (await ethers.getContractFactory('Network3')) as Network3__factory;

        myContract1F = (await ethers.getContractFactory('MyContract1')) as MyContract1__factory;
        myContract2F = (await ethers.getContractFactory('MyContract2')) as MyContract2__factory;
        myContract3F = (await ethers.getContractFactory('MyContract3')) as MyContract3__factory;

        // Deploy network
        network1 = (await upgrades.deployProxy(network1F, { initializer: '__Network_init' })) as Network1;

        myContract1 = await myContract1F.deploy(network1.address);
        myContract2 = await myContract2F.deploy(network1.address);
        myContract3 = await myContract3F.deploy(network1.address);

        await network1.registerAddress(CONTRACT1, myContract1.address);
        await network1.registerAddress(CONTRACT2, myContract2.address);
        await network1.registerAddress(CONTRACT3, myContract3.address);
    });

    it('Test 0', async () => {
        console.log(await network1.conversion());
    });

    it('Test Upgrade 1', async () => {
        network2 = (await upgrades.upgradeProxy(network1.address, network2F)) as Network2;

        console.log(await network2.conversion());
    });

    it('Test Upgrade 1', async () => {
        network3 = (await upgrades.upgradeProxy(network2.address, network3F)) as Network3;

        console.log(await network3.conversion());
    });
});
