// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

enum Status {
	Pending,
	Collected,
	Lost
}

struct Quantity {
	uint256 pet;
	uint256 aluminum;
}

struct Collection {
	uint256 wasteId;
	address collector;
	Status status;
	Quantity quantity;
}

struct Reception {
	uint256 wasteId;
	address recycler;
	Quantity receivedQuantity;
}

struct Reliability {
	uint256 reliabilityScore;
	uint256 totalCollections;
}

contract CollectionAndReception {
	mapping(address => Reliability) public reliability;
	mapping(uint256 => Collection) public collections;
	mapping(uint256 => Reception) public receptions;

	event WasteCollected(
		uint256 indexed wasteId,
		address indexed collector,
		Quantity receivedQuantity,
		Status collectedStatus
	);
	event WasteReceived(
		uint256 indexed wasteId,
		address indexed recycler,
		Quantity receivedQuantity
	);

	function recordCollection(
		uint256 wasteId,
		bool collected,
		Quantity memory quantity
	) public {
		require(
			quantity.pet > 0 || quantity.aluminum > 0,
			"Waste was not collected"
		);
		collections[wasteId] = Collection({
			wasteId: wasteId,
			collector: msg.sender,
			status: collected ? Status.Collected : Status.Lost,
			quantity: quantity
		});
		emit WasteCollected(
			wasteId,
			msg.sender,
			quantity,
			collected ? Status.Collected : Status.Lost
		);
	}

	function recordReception(
		uint256 wasteId,
		Quantity memory receivedQuantity
	) public {
		require(
			receivedQuantity.pet > 0 || receivedQuantity.aluminum > 0,
			"Waste was not received"
		);
		require(
			collections[wasteId].status == Status.Collected,
			"Waste was not collected"
		);
		require(receptions[wasteId].wasteId == 0, "Waste was already received");

		receptions[wasteId] = Reception({
			wasteId: wasteId,
			recycler: msg.sender,
			receivedQuantity: receivedQuantity
		});
		emit WasteReceived(wasteId, msg.sender, receivedQuantity);

		uint256 reliabilityScore = calculateReliability(wasteId);
		Reliability storage prevSenderReliability = reliability[msg.sender];
		prevSenderReliability.reliabilityScore =
			(prevSenderReliability.reliabilityScore *
				prevSenderReliability.totalCollections +
				reliabilityScore) /
			(prevSenderReliability.totalCollections + 1);
		prevSenderReliability.totalCollections++;
	}

	function calculateReliability(
		uint256 wasteId
	) public view returns (uint256) {
		Collection memory collection = collections[wasteId];
		Reception memory reception = receptions[wasteId];
		require(
			collection.status == Status.Collected,
			"Waste was not collected"
		);

		uint256 scale = 100;

		// Reliability is 100 if the recycler received the exact quantity of waste collected.
		uint256 reliabilityScore = (((scale * reception.receivedQuantity.pet) /
			(collection.quantity.pet)) * 50) /
			scale +
			(((scale * reception.receivedQuantity.aluminum) /
				(collection.quantity.aluminum)) * 50) /
			scale;

		if (reliabilityScore > 100) {
			reliabilityScore = 100;
		}

		return reliabilityScore;
	}
}
