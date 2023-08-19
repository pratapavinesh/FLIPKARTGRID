// contracts/User.sol
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;
import "./Wallet.sol";
import "./Transaction.sol";
contract User{
    struct user{
        string name;
        string type;
        address userAddress;
        string about;
        string twitterHandle;
        string facebookHandle;
        Wallet.wallet walletInformation;
        Transaction.transaction[] transactionsActivity;
    }
}