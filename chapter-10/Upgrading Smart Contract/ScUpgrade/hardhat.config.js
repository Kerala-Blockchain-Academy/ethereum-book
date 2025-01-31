require("@nomiclabs/hardhat-waffle");

// main imports for this project
require("@nomiclabs/hardhat-ethers");
require('@openzeppelin/hardhat-upgrades');

mnemonic = "ur seed phrase with ether on goerli (ether on 0th account)";

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  defaultNetwork: "local",
  networks: {
    local: {
      url: "http://127.0.0.1:8545"
    },
    goril: {
      url: "https://goerli.infura.io/v3/4e93089dc6874ab19a33b4c7cf287374",
      accounts: {mnemonic: mnemonic}
      // accounts: [privateKey1, privateKey2, ...]
    }
  },
  solidity: "0.8.4",
};
