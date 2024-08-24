// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract FardoNFT is ERC721 {
	using Counters for Counters.Counter;
	Counters.Counter private _tokenIdCounter;

	struct Fardo {
		uint256 weight;
		string material;
	}

	mapping(uint256 => Fardo) public fardos;

	constructor() ERC721("FardoNFT", "FARDO") {}

	function mintFardoNFT(uint256 weight, string memory material) public {
		uint256 tokenId = _tokenIdCounter.current();
		_tokenIdCounter.increment();

		fardos[tokenId] = Fardo({ weight: weight, material: material });

		_mint(msg.sender, tokenId);
	}

	function transferFardoNFT(address to, uint256 tokenId) public {
		transferFrom(msg.sender, to, tokenId);
	}

	function getFardoDetails(
		uint256 tokenId
	) public view returns (Fardo memory) {
		require(
			_exists(tokenId),
			"ERC721Metadata: Query for nonexistent token"
		);
		return fardos[tokenId];
	}
}
