// SPDX-License-Identifier: MIT
// Testbed code - we will not be goping with ERC-20 - Jeromemacg)
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PropertyToken is ERC20, Ownable {

    address public stablecoinAddress; // USDC or similar stablecoin
    mapping(address => bool) public whitelisted;
    address[] public tokenHolders;

    constructor(
        string memory name,
        string memory symbol,
        uint256 initialSupply,
        address _stablecoinAddress
    ) ERC20(name, symbol) {
        _mint(msg.sender, initialSupply);
        stablecoinAddress = _stablecoinAddress;
        whitelisted[msg.sender] = true;
        tokenHolders.push(msg.sender);
    }

    modifier onlyWhitelisted(address user) {
        require(whitelisted[user], "User not whitelisted");
        _;
    }

    function whitelistInvestor(address investor) external onlyOwner {
        whitelisted[investor] = true;
    }

    function transfer(address to, uint256 amount)
        public
        override
        onlyWhitelisted(to)
        returns (bool)
    {
        bool success = super.transfer(to, amount);
        if (balanceOf(to) > 0 && !_isHolder(to)) {
            tokenHolders.push(to);
        }
        return success;
    }

    function _isHolder(address addr) internal view returns (bool) {
        for (uint256 i = 0; i < tokenHolders.length; i++) {
            if (tokenHolders[i] == addr) return true;
        }
        return false;
    }

    function distributeRent() external onlyOwner {
        IERC20 stablecoin = IERC20(stablecoinAddress);
        uint256 balance = stablecoin.balanceOf(address(this));
        uint256 totalTokens = totalSupply();

        for (uint256 i = 0; i < tokenHolders.length; i++) {
            address holder = tokenHolders[i];
            uint256 holderBalance = balanceOf(holder);
            if (holderBalance == 0) continue;

            uint256 amount = (balance * holderBalance) / totalTokens;
            stablecoin.transfer(holder, amount);
        }
    }

    // Allow contract to receive stablecoin rent payments
    function depositRent(uint256 amount) external {
        IERC20 stablecoin = IERC20(stablecoinAddress);
        stablecoin.transferFrom(msg.sender, address(this), amount);
    }
}
