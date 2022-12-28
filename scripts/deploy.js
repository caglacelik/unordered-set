const hre = require("hardhat");

async function main() {
  contract = await (await hre.ethers.getContractFactory("Set")).deploy();
  await contract.deployed();
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
