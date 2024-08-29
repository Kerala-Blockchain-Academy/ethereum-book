
import "dotenv/config";
import axios from "axios";
import {abi,instance} from "./app.js";
const timer = ms => new Promise(res => setTimeout(res, ms));

initOracle();

async function initOracle(){
    while(true) {
        let data1 = await axios.get(" https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=BTC,USD,EUR")
        let  usd= JSON.stringify(data1.data.USD);
        console.log("Read Data from truth point, USD rate is:", usd)
        console.log(abi);
        
        let txnReceipt = await instance.setPriceData(usd);
        
       console.log(txnReceipt);
        console.log("Updated on-chain oracle contract")
    //   
         await timer(30000);
        }}
