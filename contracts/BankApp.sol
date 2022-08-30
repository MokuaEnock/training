//SPDX-License-Idebntifier: UNLICENSED

pragma solidity ^0.8.4;

contract BankApp {
  string name;
  address public manager;
  struct Account {
    uint256 id;
    string name;
    string kraPin;
    uint256 balance;
    bool status;
  }

  mapping(address => Account) accounts;

  constructor(string memory _name) {
    manager = msg.sender;
    name = _name;
  }

  function register(
    address user,
    uint256 id,
    string memory name,
    string memory kraPin,
    uint256 balance
  ) public returns (bool) {
    require(msg.sender == manager, "Send not manager");

    Account memory account = accounts[user];
    // check if the account is created
    if (account.id != 0) {
      revert("Account already exist");
    }

    account.id = id;
    account.name = name;
    account.kraPin = kraPin;
    account.balance = balance;
    accounts[user] = account;
    return true;
  }

  function login() public returns (bool) {
    address _user = msg.sender;
    Account memory account = accounts[_user];

// check if the user account exists if not revert with an error
    if (account.id == 0) {
      revert ("No account");
    }
   if (account.status){
    return true;
   }
  }
}
