// contracts/LoayaltyProgram.sol
// SPDX-License-Identifier: MIT

// This is the main contract
// for the Cosmos Token (CMOS)
// It will be used for loyality programs and rewards
// for the Flipkart customers
pragma solidity ^0.8.17;

import "./User.sol";
import "./CosmosForLocal.sol";
import "./Transaction.sol";
import "./Wallet.sol";

contract LoayaltyProgram is CosmosForLocal{
    using personAlias for User.user;
    using transactionAlias for Transaction.transaction;
    using walletAlias for Wallet.wallet;

    // this will map the User with their address
    mapping(address => person) public addressToUser;

    // store the address
    address[] public keys;

    // This function will return the partners
    function getPartners() public view returns (personAlias[] memory) {
        // Return the partners
       personAlias[] partner;
        for(uint i=0; i<addressToUser; i++){
            partner.push(addressToUser[key[i]]);
        }
        return partners;
    }

    // This function will return the transactions of the sender
    function getTransactions( address _address ) public view returns (personAlias.transactionsActivity memory) {
        // Return the transactions of the sender
        return addressToUser[_address].user.transactionsActivity;
    }

    
    // This function will return the balance of the sender
    function getBalance() public view returns (uint256) {
        // Return the balance of the sender
        return addressToUser[msg.sender].user.walletInformation.amount;
    }

    function addPartner(personAlias memory _person ) public virtual override returns (bool success) {
        // Check if the sender is the contract creator
        require(msg.sender == ownerAddres);

        // Add the partner to the partners array
        key.push(_person.userAddress);
        addressToUser[_person.userAddress]=_person;
        
        // Return true
        return true;
    }

    // This function will remove the partner
    function removePartner(address _partnerAddress) public virtual override returns (bool success) {
        // Check if the sender is the contract creator
        require(msg.sender == ownerAddres);

        // Loop through the partners array
        for (uint256 i = 0; i < keys.length; i++) {
            // Check if the partner is found
            if (keys[i] == _partnerAddress) {
                // Remove the partner from the partners array
                keys[i] = keys[keys.length - 1];
                delete addressToUser[_partnerAddress];
                keys.pop();

                // Return true
                return true;
            }
        }
        // Return false
        return false;
    }

    // This function will transfer the tokens from the sender to the receiver
    function transfer( address _to, uint256 _value ) public virtual override returns (bool success) {
        // Check if the sender has enough tokens
        require(addressToUser[msg.sender].user.wallet.amount >= _value);

        // Subtract the tokens from the sender
        addressToUser[msg.sender].user.wallet.amount -= _value;

        // Add the tokens to the receiver
        addressToUser[_to].user.wallet.amount += _value;

        // Add the transaction to the transactions mapping
        addressToUser[msg.sender].transactionsActivity.push(transactionAlias());
        transactions[msg.sender].push(Transaction(msg.sender, _to, _value));
        transactions[_to].push(Transaction(msg.sender, _to, _value));

        // Emit the transfer event
        emit Transfer(msg.sender, _to, _value);

        // Return true
        return true;
    }

    // This function will transfer the tokens from the sender to the receiver
    function transferFrom( address _from, address _to, uint256 _value ) public virtual override returns (bool success) {
        // Check if the sender is the contract creator
        require(msg.sender == ownerAddres);
        // Check if the sender has enough tokens
        require(balanceOf[_from] >= _value);

        // Subtract the tokens from the sender
        balanceOf[_from] -= _value;

        // Add the tokens to the receiver
        balanceOf[_to] += _value;

        // Add the transaction to the transactions mapping
        transactions[_from].push(Transaction(_from, _to, _value));
        transactions[_to].push(Transaction(_from, _to, _value));

        // Emit the transfer event
        emit Transfer(_from, _to, _value);

        // Return true
        return true;
    }

    // This function will mint the tokens to the receiver
    function mint(address _to, uint256 _value) public virtual returns (bool success) {
        // Check if the sender is the contract creator
        require(msg.sender == ownerAddres);

        // Add the tokens to the receiver
        balanceOf[_to] += _value;

        // Add the tokens to the total supply
        totalSupply += _value;

        // Add the transaction to the transactions mapping
        transactions[_to].push(Transaction(address(0), _to, _value));

        // Emit the transfer event
        emit Transfer(address(0), _to, _value);

        // Return true
        return true;
    }

        // This function will burn the tokens from the sender
    function burn(uint256 _value) public virtual returns (bool success) {
        // Check if the sender has enough tokens
        require(balanceOf[msg.sender] >= _value);

        // Subtract the tokens from the sender
        balanceOf[msg.sender] -= _value;

        // Subtract the tokens from the total supply
        totalSupply -= _value;

        // Add the transaction to the transactions mapping
        transactions[msg.sender].push(
            Transaction(msg.sender, address(0), _value)
        );

        // Emit the transfer event
        emit Transfer(msg.sender, address(0), _value);

        // Return true
        return true;
    }


    // This function will reward the tokens to the sender
    function reward( address _partner, uint256 _value ) public virtual returns (bool success) {
        // require partner to be in authorised partners
        // Loop through the partners array
        bool hasPartner = false;
        for (uint256 i = 0; i < partners.length; i++) {
            // Check if the partner is found
            if (partners[i].partner == _partner) {
                hasPartner = true;
            }
        }
        require(hasPartner == true);

        // calculate the tokens according to value
        uint256 tokensValue = _value / 100;

        // Check if the partner has enough tokens
        require(balanceOf[_partner] >= tokensValue);

        // subtract the tokens from the partner
        balanceOf[_partner] -= tokensValue;

        // add the tokens to the sender
        balanceOf[msg.sender] += tokensValue;

        // Add the transaction to the transactions mapping
        transactions[msg.sender].push(
            Transaction(_partner, msg.sender, tokensValue)
        );
        transactions[_partner].push(
            Transaction(_partner, msg.sender, tokensValue)
        );

        // return true
        return true;
    }


    // This function will redeem the tokens from the sender
    function redeem(uint256 _value) public virtual override returns (bool success) {
        // Check if the sender has enough tokens
        require( addressToUser[msg.sender].wallet.amount >= _value);

        // Subtract the tokens from the sender
        addressToUser[msg.sender].wallet.amount -= _value;

        // Subtract the tokens from the total supply
        totalSupply -= _value;

        // Add the transaction to the transactions mapping
            
        addressToUser[msg.sender].trasactionsActivity.push(
            transactionAlias(msg.sender, address(0), _value)
        );

        // Emit the transfer event
        emit Transfer(msg.sender, address(0), _value);

        // Return true
        return true;
    }
}