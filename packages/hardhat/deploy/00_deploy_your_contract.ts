import { HardhatRuntimeEnvironment } from "hardhat/types";
import { DeployFunction } from "hardhat-deploy/types";

/**
 * Deploys a contract named "YourContract" using the deployer account and
 * constructor arguments set to the deployer address
 *
 * @param hre HardhatRuntimeEnvironment object.
 */
const deployYourContract: DeployFunction = async function (hre: HardhatRuntimeEnvironment) {
  /*
    On localhost, the deployer account is the one that comes with Hardhat, which is already funded.

    When deploying to live networks (e.g `yarn deploy --network sepolia`), the deployer account
    should have sufficient balance to pay for the gas fees for contract creation.

    You can generate a random account with `yarn generate` which will fill DEPLOYER_PRIVATE_KEY
    with a random private key in the .env file (then used on hardhat.config.ts)
    You can run the `yarn account` command to check your balance in every network.
  */
  const { deployer } = await hre.getNamedAccounts();
  const { deploy } = hre.deployments;

  const c1 = await deploy("WasteRegistry", {
    from: deployer,
    // Contract constructor arguments
    args: [],
    log: true,
    // autoMine: can be passed to the deploy function to make the deployment process faster on local networks by
    // automatically mining the contract deployment transaction. There is no effect on live networks.
    autoMine: true,
  });

  console.log("WasteRegistry deployed to:", c1.address);

  const c2 = await deploy("CollectionAndReception", {
    from: deployer,
    args: [],
    log: true,
    autoMine: true,
  });

  console.log("CollectionAndReception deployed to:", c2.address);

  const c3 = await deploy("FardoNFT", {
    from: deployer,
    args: [],
    log: true,
    autoMine: true,
  });

  console.log("FardoNFT deployed to:", c3.address);

  const c4 = await deploy("FardoMarketplace", {
    from: deployer,
    args: [c3.address],
    log: true,
    autoMine: true,
  });

  console.log("FardoMarketplace deployed to:", c4.address);

  console.log("Successfully deployed all contracts!!", hre.network.name);

  // Get the deployed contract to interact with it after deploying.
  // const yourContract = await hre.ethers.getContract<Contract>("YourContract", deployer);
  // console.log("👋 Initial greeting:", await yourContract.greeting());

  if (hre.network.name !== "localhost") {
    console.log("Verifying contract...");

    try {
      await hre.run("verify:verify", { address: c1.address, constructorArguments: [] });
      console.log("Contract WasteRegistry verified!");

      await hre.run("verify:verify", { address: c2.address, constructorArguments: [] });
      console.log("Contract CollectionAndReception verified!");

      await hre.run("verify:verify", { address: c3.address, constructorArguments: [] });
      console.log("Contract FardoNFT verified!");

      await hre.run("verify:verify", { address: c4.address, constructorArguments: [c3.address] });
      console.log("Contract FardoMarketplace verified!");
    } catch (error) {
      if ((error as any)?.message.toLowerCase().includes("already verified")) {
        console.log("Contract already verified!");
      } else {
        console.error("Verification failed:", error);
      }
    }
  }
  console.log("Successful deployment!");
};

export default deployYourContract;

// Tags are useful if you have multiple deploy files and only want to run one of them.
// e.g. yarn deploy --tags YourContract
deployYourContract.tags = ["AllContracts"];
