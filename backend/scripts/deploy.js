const hre = require("hardhat");

async function main() {
  const CosmosToken = await hre.ethers.getContractFactory("CosmosToken");
  const cosmosToken = await CosmosToken.deploy(100000000, 50);

  await cosmosToken.deployed();

  console.log("Cosmos Token deployed: ", cosmosToken.address);
}
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
