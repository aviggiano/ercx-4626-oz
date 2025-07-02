// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC20Mock} from "openzeppelin-contracts/mocks/ERC20Mock.sol";
import {IERC20} from "openzeppelin-contracts/token/ERC20/IERC20.sol";
import {ERC4626Test} from "ercx-tests/ERC4626/Light/ERC4626Test.sol";
import {ERC4626Vault} from "../src/ERC4626Vault.sol";

contract ERC4626VaultTest is ERC4626Test {
    uint256 public constant INITIAL_SUPPLY = 10e18;
    function setUp() public {
        ERC20Mock token = new ERC20Mock();
        ERC4626Vault vault = new ERC4626Vault(IERC20(address(token)), "Test Vault", "TV");

        token.mint(address(this), INITIAL_SUPPLY);
        token.approve(address(vault), INITIAL_SUPPLY);
        vault.deposit(INITIAL_SUPPLY, address(vault));

        ERC4626Test.init(address(vault));
    }
}
