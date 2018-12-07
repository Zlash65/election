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

	uint public candidatesCount;

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


}