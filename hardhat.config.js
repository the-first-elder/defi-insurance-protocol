require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

/** @type import('hardhat/config').HardhatUserConfig */
// const { , , API_KEY } = process.env;
const API_URL = process.env.API_URL || 'url';
const PRIVATE_KEY = process.env.PRIVATE_KEY || 'key'
const etherscan = process.env.ETHERSCAN_KEY || "ether"
console.log(API_URL)

module.exports = {
  solidity: "0.8.20",
  paths: {
    artifacts: './artifacts',
  },
  mocha: {
    timeout: 40000,
  },
  networks: {
    // localhost: {
    //   chainId: 31337
    // },

    sepolia: { url: API_URL, accounts: [PRIVATE_KEY], chainId: 11155111 }
  },
  etherscan: {
    apiKey: {
      sepolia: etherscan
    },
    plugins: [
      "@nomiclabs/hardhat-etherscan"
    ]
  }
};
