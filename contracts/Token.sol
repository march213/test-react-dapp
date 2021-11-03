//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Token {
  string public name = "Jane M Token";
  string public symbol = "JMT";
  uint public totalSupply = 1000000;
  mapping(address => uint) balances;

  constructor() {
    balances[msg.sender] = totalSupply;
  }

  function transfer(address _to, uint _amount) external {
    require(balances[msg.sender] >= _amount, "Not enought tokens");
    balances[msg.sender] -= _amount;
    balances[_to] += _amount;
  }

  function balanceOf(address _owner) external view returns (uint) {
    return balances[_owner];
  }
}