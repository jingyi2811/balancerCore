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

        IWeightedPool pool = IWeightedPool(address(0x6f0ed6f346007563D3266DE350d174a831bDE0ca));

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
//        bytes32 addr = 0x06df3b2bbb68adc8b0e302443692037ed9f91b42000000000000000000000063;
//
//        // Balancer 80%, Weth 20%
//        (address[] memory tokens, uint256[] memory balances, uint256 lastChangeBlock) = balancer.getPoolBalance(addr);
//
//        console.log(tokens.length); // 3

        {
            IStablePool pool = IStablePool(address(0x06Df3b2bbB68adc8B0e302443692037ED9f91b42));
            console.logBytes32(pool.getPoolId()); // 0x06df3b2bbb68adc8b0e302443692037ed9f91b42000000000000000000000063
            //uint[] memory scalingFactor = pool.getScalingFactors();
        }

        {
            IStablePool pool = IStablePool(address(0xFf4ce5AAAb5a627bf82f4A571AB1cE94Aa365eA6));
            console.logBytes32(pool.getPoolId());
            uint[] memory scalingFactor = pool.getScalingFactors();
        }

        //console.log(scalingFactor.length);

        //        console.log(address(tokens[0])); // WsETH
//        console.log(address(tokens[1]));
//        console.log(address(tokens[2]));
//        console.log(address(tokens[3]));


        //        assertEq(address(tokens[0]), 0x7f39c581f595b53c5cb19bd0b3f8da6c935e2ca0); // WsETH
//        assertEq(address(tokens[1]), 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2); // IWETH

//        console.log(balances[0]);
//        console.log(balances[1]);
//
//        console.log(lastChangeBlock);
//
//        IWeightedPool pool = IWeightedPool(address(0x5c6Ee304399DBdB9C8Ef030aB642B10820DB8F56));
//
//        // Get pool ID
//        uint[] memory x = pool.getNormalizedWeights();
//        console.log(x.length);
//        console.log(x[0]);
//        console.log(x[1]);
//
//        console.log(pool.getInvariant());
//        console.log(pool.totalSupply());
//        console.logBytes32(pool.getPoolId());
//        console.log(pool.decimals());
    }
}