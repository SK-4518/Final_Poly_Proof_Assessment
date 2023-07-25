pragma solidity ^0.5.11;

contract ElectionVoting{

    struct Candidate{
        uint id;
        string name;
        uint voteCount;

    }

    mapping (uint => Candidate) public candidates;
    uint public candidatecount;
    mapping (address => bool) public voter;

    event eventVote(
        uint indexed _candidateid
    );

    function Election ()public{
        addCandidate("Alice");
        addCandidate("Bob");
    }

    function addCandidate (string memory _name) private{
        candidatecount ++;
        candidates[candidatecount] = Candidate(candidatecount, _name, 0);
    }

    function vote(uint _candidateid) public {

        require(!voter[msg.sender]);

        require(_candidateid > 0 && _candidateid <= candidatecount);

        voter[msg.sender] = true;

        candidates[_candidateid].voteCount ++;

        emit eventVote(_candidateid);
    }

}
