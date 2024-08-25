# Ginova

Making the circular economy more efficient and traceable than ever

## This project

This repository contains a prototype of the Ginova blockchain bussiness model. It is a decentralized application that allows the traceability of waste from its generation to its recycling.

- **WasteRegistry**: A smart contract that allows the registration of waste by the users that generate it.
- **CollectionAndReception**: A smart contract that allows the registration of the collection and reception of waste by the users that collect it.
- **FardoNFT**: A smart contract that allows the minting of NFTs for the waste registered in the WasteRegistry.
- **FardoMarketplace**: A smart contract that allows the sale of the NFTs minted in the FardoNFT contract.

### Technologies

We used Scaffold-eth-2 to build the project easily focusing on the business logic of the project. We deployed our project simultaneously on Polygon Amoy Testnet and Arbitrum Sepolia Testnet to show the scalability of the project.

You can access the frontend deployed on: [Vercel](https://aleph-hackathon-eta.vercel.app/)

You can switch between networks using the dropdown on the top right corner of the page or changing the network in the Metamask extension or your connected wallet.

#### Polygon Amoy Deployed Contracts

- WasteRegistry deployed to: 0x4f5D019771312889A4C2E23999640795B58597fA [Explorer](https://amoy.polygonscan.com/address/0x4f5D019771312889A4C2E23999640795B58597fA)
- CollectionAndReception deployed to: 0xE7609C6FAb936b10ECf6410E91Cd0C53B73Aa1eb [Explorer](https://amoy.polygonscan.com/address/0xE7609C6FAb936b10ECf6410E91Cd0C53B73Aa1eb)
- FardoNFT deployed to: 0xdd049c9e60A90356D4800568ae7CC8604272580B [Explorer](https://amoy.polygonscan.com/address/0xdd049c9e60A90356D4800568ae7CC8604272580B)
- FardoMarketplace deployed to: 0x6Ddb64Ca2c8F6B5EfdB1752ddB8078B8FF74c42D [Explorer](https://amoy.polygonscan.com/address/0x6Ddb64Ca2c8F6B5EfdB1752ddB8078B8FF74c42D)

#### Arbitrum Sepolia Deployed Contracts

- WasteRegistry deployed to: 0x4f5D019771312889A4C2E23999640795B58597fA [Explorer](https://sepolia.arbiscan.io/address/0x4f5D019771312889A4C2E23999640795B58597fA)
- CollectionAndReception deployed to: 0xE7609C6FAb936b10ECf6410E91Cd0C53B73Aa1eb [Explorer](https://sepolia.arbiscan.io/address/0xE7609C6FAb936b10ECf6410E91Cd0C53B73Aa1eb)
- FardoNFT deployed to: 0xdd049c9e60A90356D4800568ae7CC8604272580B [Explorer](https://sepolia.arbiscan.io/address/0xdd049c9e60A90356D4800568ae7CC8604272580B)
- FardoMarketplace deployed to: 0x6Ddb64Ca2c8F6B5EfdB1752ddB8078B8FF74c42D [Explorer](https://sepolia.arbiscan.io/address/0x6Ddb64Ca2c8F6B5EfdB1752ddB8078B8FF74c42D)

### Usage

You can use the frontend to interact with the methods of the smart contracts directly. You can register waste, collect waste, mint NFTs and sell them in the marketplace.

In a real scenario, all this interaction would become from different users through different parts of our system. For example, the registration of waste would be done by the user that generate it, using the frontend app. The collection and reception of waste would be done by the companies that collect it, using the app too. The minting of NFTs would be done by the recycling companies through IoT devices that would register the weight of the waste and the quality of the material or even integrating with their ERP systems. Finally, the sale of the NFTs would be done by the recycling companies to the companies that need the recycled material, using a marketplace app.

For this prototype, we used this very simple frontend to simulate all these interactions. But the real power of the system is in the integration with the real world through IoT devices and other oracle services.
