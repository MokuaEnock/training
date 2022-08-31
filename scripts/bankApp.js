const hre = require("hardhat");

async function main() {
  //body

  const singers = hre.ethers.getSigners();
  console.log("signers::", singers);
  const account0 = singers[0].address;
  const BankApp = await hre.ethers.getContractFactory("BankApp");
  const bankApp = await BankApp.deploy("Loibon");
  await bankApp.deployed();

  await bankApp.register(
    "0x71bE63f3384f5fb98995898A86B02Fb2426c5788",
    "John",
    "A004edddf3",
    0,
    account0,
  );
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
