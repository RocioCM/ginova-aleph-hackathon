// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

struct Quantity {
	uint256 pet;
	uint256 aluminum;
}

struct Waste {
	uint256 id;
	address creator;
	Quantity quantity;
}

contract WasteRegistry {
	Waste[] public wastes;
	uint256 public nextWasteId = 1;

	event WasteRegistered(
		uint256 indexed wasteId,
		address indexed creator,
		Quantity quantity
	);

	function registerWaste(Quantity memory quantity) public {
		Waste memory newWaste = Waste({
			id: nextWasteId,
			creator: msg.sender,
			quantity: quantity
		});
		wastes.push(newWaste);
		emit WasteRegistered(nextWasteId, msg.sender, quantity);
		nextWasteId++;
	}

	function getWasteDetails(
		uint256 wasteId
	) public view returns (Waste memory) {
		require(wasteId <= wastes.length, "Waste ID does not exist");
		return wastes[wasteId - 1];
	}
}
