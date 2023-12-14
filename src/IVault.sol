interface IVault {
    function getPoolTokens(
        bytes32 poolId
    ) external view returns (address[] memory, uint256[] memory, uint256);
}