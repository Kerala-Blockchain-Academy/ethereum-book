async function main() {
    const BoxV2 = await ethers.getContractFactory("BoxV2")
    let box = await upgrades.upgradeProxy("0x8E46FcD91eCBFDbB7f4cAe30100CD57c2060eddf", BoxV2)
    console.log("Your upgraded proxy is done!", box.address)
}

main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error)
        process.exit(1)
    })