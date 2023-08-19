// contracts/Wallet.sol
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import "@uniswap/v2-core/contracts/libraries/FixedPoint.sol";

contract Wallet{
    using FixedPoint for *;
    struct wallet{
        string coinName;
        uint256 amount;
        uint256 value;
    }
}