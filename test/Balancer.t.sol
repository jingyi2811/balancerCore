// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/Balancer.sol";

contract BalancerTest is Test {
    Balancer balancer;

    function setUp() public {
        // Deploy the Balancer contract or set it up as needed
        balancer = new Balancer(0xBA12222222228d8Ba445958a75a0704d566BF2C8);
    }

    function testBalancerPoolBalance() public {
        // Balancer 80%, Weth 20%
        (IERC20[] memory tokens, uint256[] memory balances, uint256 lastChangeBlock) = balancer.getPoolBalance(0x5c6ee304399dbdb9c8ef030ab642b10820db8f56000200000000000000000014);

        assertEq(tokens.length, 2);
        assertEq(address(tokens[0]), 0xba100000625a3754423978a60c9317c58a424e3D); // BAL
        assertEq(address(tokens[1]), 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2); // IWETH

        console.log(balances[0]);
        console.log(balances[1]);

        console.log(lastChangeBlock);
    }
}