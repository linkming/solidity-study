// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// ✅ 创建一个名为Voting的合约，包含以下功能：

contract Voting {

    address public owner;
    //选民
    mapping (address => bool) public voter;
    // 一个mapping来存储候选人的得票数
    mapping (string => uint) public candidateCount;
    mapping (address => mapping(string => bool)) public candidateVoteValid;
    string[] public candidates = ["tump","baideng","pujing"];

    constructor(){
        owner = msg.sender;
    }

    modifier checkVote(address _address, string memory candidate){
        require(candidateVoteValid[_address][candidate],"you have not vote permission");
        _;
    }
     // 仅限 owner 的修饰器
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    // 一个vote函数，允许用户投票给某个候选人
    function vote(address _address, string memory candidate) external  {
        if (!candidateVoteValid[_address][candidate]){
            candidateVoteValid[_address][candidate] = true;
        }
    }
    // 一个getVotes函数，返回某个候选人的得票数
    function getVotes(string memory candidate) external  returns(uint){
        return candidateCount[candidate];
    }
    // 一个resetVotes函数，重置所有候选人的得票数
    function resetVotes() external onlyOwner{
        for (uint i = 0; i < candidates.length; i ++) {
            candidateCount[candidates[i]] = 0;
        }
    }
    //投票函数
    function voting(address _address, string memory candidate) external checkVote(_address,candidate){
        candidateCount[candidate] += 1;
    }
}