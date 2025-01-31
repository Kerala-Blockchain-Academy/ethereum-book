# Basic Upgradable Contract Exmaple

First install dependencies using `npm i`  
Compile contract `npx hardhat compile`

Deploy the intial contract Box using `npx hardhat run scripts/deploy.js`

### Pre-Update Testing

`npx hardhat console`
> const Box = await ethers.getContractFactory("Box")  

> const box = await Box.attach("0xCf7Ed3AccA5a467e9e704C703E8D87F634fB0Fc9")  

> (await box.retrieve()).toString()  

Upgrade using `npx hardhat run scripts/upgrade.js`

### PostUpdate
`npx hardhat console --network rinkeby`
> const BoxV2 = await ethers.getContractFactory("BoxV2")

> const boxV2 = await BoxV2.attach("0xCf7Ed3AccA5a467e9e704C703E8D87F634fB0Fc9")

> (await boxV2.retrieve()).toString()

> await boxV2.increment()

> (await boxV2.retrieve()).toString()


The above commands are for local network setup. 

## Reference
https://forum.openzeppelin.com/t/openzeppelin-upgrades-step-by-step-tutorial-for-hardhat/3580