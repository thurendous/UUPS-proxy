// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract Mars is
    Initializable,
    ERC20Upgradeable,
    UUPSUpgradeable,
    OwnableUpgradeable
{
    function initialize() public initializer {
        __ERC20_init("Mars", "MARS");
        __Ownable_init(); // important

        _mint(msg.sender, 10000000 * 10**decimals());
    }

    function _authorizeUpgrade(address newImplementation)
        internal
        override
        onlyOwner
    {}
}

contract MarsV2 is Mars {
    uint256 fee;

    function version() public pure returns (string memory) {
        return "This is v2";
    }
}

contract MarsV3 is Mars {
    // this is a mistake example
    // you need to carete a fee state variable or inherit the MarsV2 contract instead to make the sotrage position meet
    uint256 fee;
    string tax;

    function version() public pure returns (string memory) {
        return "This is v3";
    }
}
