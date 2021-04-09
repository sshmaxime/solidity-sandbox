import '@nomiclabs/hardhat-waffle';
import '@nomiclabs/hardhat-ethers';

// Extra plugins
import 'solidity-coverage';
import 'hardhat-typechain';
import 'hardhat-contract-sizer';
import '@openzeppelin/hardhat-upgrades';

import { HardhatUserConfig } from 'hardhat/config';

const Config: HardhatUserConfig = {
    networks: {
        hardhat: {
            gasPrice: 0
        }
    },
    paths: {
        sources: './contracts',
        tests: './test',
        cache: './cache',
        artifacts: './build'
    },
    solidity: {
        version: '0.6.12',
        settings: {
            optimizer: {
                enabled: true,
                runs: 200
            }
        }
    },
    mocha: {
        timeout: 600000,
        color: true,
        bail: true
    },
    contractSizer: {
        alphaSort: true,
        disambiguatePaths: false
    }
};

export default Config;
