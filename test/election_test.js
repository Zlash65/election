var Election = artifacts.require("./Election.sol");

contract("Election", function(accounts) {
	var electionCandidates;

	it("initializes with two candidates", function() {
		return Election.deployed().then(function(instance) {
			return instance.candidatesCount();
		}).then(function(count) {
			assert.equal(count, 2);
		})
	})

	it("initializes candidates with correct values", function() {
		return Election.deployed().then(function(instance) {
			electionCandidates = instance
			return electionCandidates.candidates(1);
		}).then(function(candidate) {
			assert.equal(candidate[0].toNumber(), 1, "correct id 1");
			assert.equal(candidate[1], "Candidate 1", "correct name 1");
			assert.equal(candidate[2].toNumber(), 0, "correct vote count 1");
			return electionCandidates.candidates(2);
		}).then(function(candidate) {
			assert.equal(candidate[0].toNumber(), 2, "correct id 2");
			assert.equal(candidate[1], "Candidate 2", "correct name 2");
			assert.equal(candidate[2].toNumber(), 0, "correct vote count 2");
			return electionCandidates.candidates(2);
		})
	})

})