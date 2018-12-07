pragma solidity ^0.4.24;

contract Election {

	// model a structure for Candidate
	struct Candidate {
		uint id;
		string name;
		uint voteCount;
	}

	// mapping to candidates -> sort of an array
	mapping(uint => Candidate) public candidates;

	// store accounts that have voted
	mapping(address => bool) public voters;

	uint public candidatesCount;

	event votedEvent(
		uint indexed _candidateId
	);

	// constructor
	constructor() public {
		addCandidate("Candidate 1");
		addCandidate("Candidate 2");
	}

	// adding candidate and updating count
	function addCandidate(string _name) private {
		candidatesCount++;
		candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
	}

	function vote(uint _candidateId) public {

		// check if voter already voted
		require(!voters[msg.sender]);

		// check if the candidate is legit
		require(_candidateId > 0 && _candidateId <= candidatesCount);

		// record the account that is voting
		voters[msg.sender] = true;

		// update candidate vote count
		candidates[_candidateId].voteCount++;

		// trigger voted event
		emit votedEvent(_candidateId);
	}


}