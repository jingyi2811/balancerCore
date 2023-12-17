// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/Balancer.sol";
import "../src/IWeightedPool.sol";
import "../src/IStablePool.sol";

contract BalancerTest is Test {
    Balancer balancer;

    function setUp() public {
        // Deploy the Balancer contract or set it up as needed
        balancer = new Balancer(0xBA12222222228d8Ba445958a75a0704d566BF2C8);
    }

    function testBalancerPoolBalance() public {
//        bytes32 addr = 0x06df3b2bbb68adc8b0e302443692037ed9f91b42000000000000000000000063;
//
//        // Balancer 80%, Weth 20%
//        (address[] memory tokens, uint256[] memory balances, uint256 lastChangeBlock) = balancer.getPoolBalance(addr);
//
////        assertEq(tokens.length, 2);
////        assertEq(address(tokens[0]), 0xba100000625a3754423978a60c9317c58a424e3D); // BAL
////        assertEq(address(tokens[1]), 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2); // IWETH
//
//        console.log(balances[0]);
//        console.log(balances[1]);
//
//        console.log(lastChangeBlock);

        IWeightedPool pool = IWeightedPool(address(0x08775ccb6674d6bDCeB0797C364C2653ED84F384));

        // Get pool ID
        uint[] memory x = pool.getNormalizedWeights();
        console.log(x.length);
        console.log(x[0]);
        console.log(x[1]);

        console.log(pool.getInvariant());
        console.log(pool.totalSupply());
        console.logBytes32(pool.getPoolId());
        console.log(pool.decimals());
    }

    function testBalancerStablePoolBalance() public {

        address[13] memory addresses = [
        0x3dd0843A028C86e0b760b1A76929d1C5Ef93a2dd,
        0xFf4ce5AAAb5a627bf82f4A571AB1cE94Aa365eA6,
        0xFeadd389a5c427952D8fdb8057D6C8ba1156cC56,
        0x2d011aDf89f0576C9B722c28269FcB5D50C2d179,
        0x06Df3b2bbB68adc8B0e302443692037ED9f91b42,
        0xf3AeB3aBbA741f0EEcE8a1B1D2F11b85899951CB,
        0x616D4D131F1147aC3B3C3CC752BAB8613395B2bB,
        0x178E029173417b1F9C8bC16DCeC6f697bC323746,
        0x961764651931941F23cea5bAB246607dC19ef224,
        0x384F67aA430376efc4f8987eaBf7F3f84eB9EA5d,
        0xF93579002DBE8046c43FEfE86ec78b1112247BB8,
        0x13F2f70A951FB99d48ede6E25B0bdF06914db33F,
        0xb8b6fB4474d3Bf3b878a9dfC36115792358Db096

        ];

        for (uint i = 0; i < addresses.length; i++) {
            IStablePool pool = IStablePool(addresses[i]);

            try pool.getLastInvariant() returns (uint a, uint b) {
            } catch {
                console.logBytes32(pool.getPoolId());
            }
        }
    }
}