// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// ✅ 创建一个名为Voting的合约，包含以下功能：
// 一个mapping来存储候选人的得票数
// 一个getVotes函数，返回某个候选人的得票数
// 一个resetVotes函数，重置所有候选人的得票数
contract Voting{
  mapping (address => uint) public candidateCounts; // 存储候选人的得票数
  mapping (address => bool) public hasVoted; // 存储用户是否已经投票
  // 用户是否有投票权
  mapping (address => bool) public userValid;
  address[] public users; // 存储候选人的地址
  // 一个vote函数，允许用户投票给某个候选人
  function vote(address _address) external {
    if(!userValid[_address]){
        users.push(_address);
    }
  }

}