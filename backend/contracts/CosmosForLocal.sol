// contracts/CosmosForLocal.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

import "./User.sol";

contract Cosmos {
    // This is the total supply of the token
    uint256 public totalSupply;

    // This is the name of the token
    string public  name;

    // This is the symbol of the token
    string public  symbol;

    // This is the owner of the contract
    address public ownerAddres;


    // This is the constructor It will be called only once
    constructor(uint256 _initialSupply, string memory _name, string memory _symbol) {
        // Set the total supply
        totalSupply = _initialSupply;
        
        //set the the symbol of the token
        symbol = _symbol;

        // set the name of the token
        name = _name;

        // Set the owner of the contract
        ownerAddres = msg.sender;

        // Set the balance of the contract creator
        balanceOf[msg.sender] = _initialSupply;

        // Emit the transfer event
        emit Transfer(address(0), msg.sender, _initialSupply);

        // Add the transaction to the transactions mapping
        transactions[msg.sender].push(
            Transaction(address(0), msg.sender, _initialSupply)
        );
    }

    // This is the event that will be emitted when the transfer is successful
    event Transfer(address indexed from, address indexed to, uint256 value);

    // This function will add the partner
    function addPartner(string memory _name, address _partner ) public virtual returns (bool success) {}

    // This function will remove the partner
    function removePartner(address _partner) public virtual returns (bool success) {}

    // This function will transfer the tokens from the sender to the receiver
    function transfer( address _to, uint256 _value ) public virtual returns (bool success) {}

    // This function will transfer the tokens from the sender to the receiver
    function transferFrom( address _from, address _to, uint256 _value ) public virtual returns  (bool success) {}

    // This function will mint the tokens to the receiver
    function mint(address _to, uint256 _value) public virtual returns (bool success) {}

    // This function will burn the tokens from the sender
    function burn(uint256 _value) public virtual returns (bool success) {}

    // This function will reward the tokens to the sender
    function reward( address _partner, uint256 _value ) public virtual returns (bool success) {}

    // This function will redeem the tokens from the sender
    function redeem(uint256 _value) public virtual returns (bool success) {}
}
