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

## Future System Architecture

![imagen](https://github.com/user-attachments/assets/dac8d07a-4a5b-433e-94d1-0ee3677f5264)

1. **Frontend Mobile App for Citizens**: Allows citizens to interact with the system for submitting waste details, checking waste traceability and claim rewards.

2. **Frontend Mobile App for Recyclers**: Provides recyclers with functionality to track collections, update statuses, plan collection routes and interact with the waste registry.

3. **Frontend Desktop App for Recycling Plants**: Enables recycling plants to manage reception, processing, and status updates related to the waste registry and collection. Also, possibly mints the NFTs representing recycled materials.

4. **Frontend Web App for NFTs Open Marketplace**: A web interface where users can view, buy, and sell NFTs representing bales of recycled materials.

5. **Middleend API Gateway**: Central point for handling API requests from all frontend apps. Routes requests to the appropriate backend services, whether it’s traditional APIs or Blockchain interfaces.

6. **Blockchain Backend**:

   - **WasteRegistry Smart Contract**: Tracks waste from the point of registration until collected.
   - **CollectionAndReception Smart Contract**: Manages the logistics of waste collection and reception in the classification plant.
   - **FardoNFT Smart Contract**: Generates NFTs based on processed waste, representing bundles of recycled materials.
   - **FardoMarketplace Smart Contract**: Facilitates the buying and selling of NFTs on the open market.

7. **App API with SQL DB**: Manages user data, collection routes, metrics, views, and other non-blockchain-related data.

8. **Blockchain Contracts Interface API**: Interacts with the blockchain and handles data storage in a traditional database to support quick lookups and reporting.

9. **Oracles Network (Chainlink)**: Provides validation on wast data to the blockchain, providing external data to the smart contracts concerning waste quality from citizens.

#### Frontend Layer:

- **Frontend Apps** communicate with the API Gateway via HTTPS REST API and possibly Web3.js for direct blockchain interactions and NFT minting.

#### Middleend Layer:

- **API Gateway** routes requests to the **Apps API** for user management, collection routes, and other non-blockchain operations. Routes requests to the **Blockchain Contracts Interface API** for blockchain-related operations. It facilitates communication between frontend apps and backend services.
- **Blockchain Contracts Interface API**:
  - Interacts with the blockchain to read and write data via smart contracts.
  - Stores relevant data in a traditional database for non-blockchain operations and reporting.

#### Backend Layer:

- **App API with SQL DB**: Manages user information and interacts with the frontend via the API Gateway.
- **Blockchain Backend**:
  - **Smart Contracts** interact with each other.
  - **Chainlink Oracles** provide external data to the blockchain, which is used by the WasteRegistry smart contract.
- **SQL Database**: Used by the App API and Blockchain Contracts Interface API for fast data retrieval and reporting.
