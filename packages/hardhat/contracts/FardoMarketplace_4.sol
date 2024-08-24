// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./FardoNFT_3.sol";

contract FardoMarketplace {
	struct Sale {
		uint256 tokenId;
		address seller;
		uint256 price;
	}

	mapping(uint256 => Sale) public sales;
	FardoNFT public fardoNFTContract;
	uint256 public platformFee = 500; // 5%

	event FardoListedForSale(
		uint256 indexed tokenId,
		address indexed seller,
		uint256 price
	);
	event FardoSold(
		uint256 indexed tokenId,
		address indexed buyer,
		uint256 price
	);

	constructor(address fardoNFTAddress) {
		fardoNFTContract = FardoNFT(fardoNFTAddress);
	}

	function listForSale(uint256 tokenId, uint256 price) public {
		require(
			fardoNFTContract.ownerOf(tokenId) == msg.sender,
			"Only the owner can list this NFT"
		);
		require(price > 0, "Price must be greater than zero");

		sales[tokenId] = Sale({
			tokenId: tokenId,
			seller: msg.sender,
			price: price
		});

		emit FardoListedForSale(tokenId, msg.sender, price);
	}

	function buyFardo(uint256 tokenId) public payable {
		Sale memory sale = sales[tokenId];
		require(msg.value == sale.price, "Incorrect price");

		// Calculate fees
		uint256 fee = (msg.value * platformFee) / 10000;
		uint256 sellerAmount = msg.value - fee;

		// Transfer ownership of the NFT
		fardoNFTContract.transferFrom(sale.seller, msg.sender, tokenId);

		// Transfer funds
		payable(sale.seller).transfer(sellerAmount);

		// Remove from sales mapping
		delete sales[tokenId];

		emit FardoSold(tokenId, msg.sender, sale.price);
	}

	function rateFardoQuality(uint256 tokenId, uint8 rating) public view {
		require(
			fardoNFTContract.ownerOf(tokenId) == msg.sender,
			"Only the owner can rate this NFT"
		);
		require(rating >= 1 && rating <= 5, "Rating must be between 1 and 5");
		require(
			fardoNFTContract.getFardoDetails(tokenId).qualityRating == 0,
			"Quality rating already given"
		);

		fardoNFTContract.getFardoDetails(tokenId).qualityRating = rating;
	}
}
