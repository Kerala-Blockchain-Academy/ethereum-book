# Sample Oracle Project


This project is to demonstrate the use of oracle in blockchain to get real-world information.Here we are getting the realworld price of Ether in USD. In this app, we are using hardhat framework for deploying the contract.Here we are taking two contracts- OracleV1.sol is the contract that gets updated information on regular intervals and OracleV2.sol is the contract that gets updated information on getting an event.There are two more contracts that interact with the OracleV1 & OracleV2 contract.


Here the contract OracleV1 & Oracle V2 is deployed in sepolia and you can find the details on Details1.json & Details2.json in app folder.In the app folder, there are two js files- initOracle.js & eventOracle.js. InitOracle.js files call the apis and get the real-world information and write it to blockchain.eventOracle.js file listen for any event and on getting an event it will get the information from apis and populate it to blockchain.


Steps to do
1. Open the folder in VSCode
2. Move to the folder app
3. First run initOracle.js using the command
```
node initOracle.js

```

4. Now open RemixIDE and open the contract interactOV1.sol in it. Then deploy the contract using the OracleV1 contract address. And then interact with the Remix interface.Click the getPriceData button, you will get the real-world price of ether in USD

5. Now we can run eventOracle.js using the command

```
node eventOracle.js

```

6. Now open interactOV2.sol in RemixIDE and deploy the contract using OracleV2 contract address and interact with the Remix interface.Here you have to first click the requestUpdate button that generates a request to OracleV2 that emits an event. On getting the event the eventOracle.js file will get the updated real-world information from an api and populate it to blockchain.Now click the getPriceData button to get the data.


Commands to compile contract using hardhat

```
npx hardhat compile

```


Commands to run contract using hardhat

```
npx hardhat run ./scripts/deployV1.js 

```

