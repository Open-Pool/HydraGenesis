pragma solidity >=0.5.8;

/**
 * @title True random number generator
 * @notice This is a contract to generate a true random number on blockchain.
 * Though true random number generators doesn't require seed. But, to simplify
 * the functions i used seed and other terms used in PRNGs,
 * seed should be enough to generate a random number, but to randomize the pattern
 * even more i added two more functions with salt and sugar.
 */
contract Test {
    /**
        * @notice Generates a random number between 0 - 100
        * @param seed The seed to generate different number if block.timestamp is same
        * for two or more numbers.
        */
    function importSeedFromThird(uint256 seed) public view returns (uint8) {
        bytes32 bHash = blockhash(block.number - 1);
        uint8 randomNumber = uint8(
            uint256(keccak256(abi.encodePacked(block.timestamp, bHash, seed))) % 100
        );
        return randomNumber;
    }

    /**
     * @notice Generates a random number between 0 - 100
     * @param seed The seed to generate different number if block.timestamp is same
     * for two or more numbers.
     * @param salt The salt to randomize the pattern
     */
    function importSeedFromThirdSalt(uint256 seed, uint256 salt)
        public
        view
        returns (uint8)
    {
        bytes32 bHash = blockhash(block.number - 1);
        uint8 randomNumber = uint8(uint256(keccak256(abi.encodePacked(block.timestamp, bHash, seed, salt))) % 100);
        return randomNumber;
    }

    /**
     * @notice Generates a random number between 0 - 100
     * @param seed The seed to generate different number if block.timestamp is same
     * for two or more numbers.
     * @param salt The salt to randomize the pattern
     * @param sugar The sugar same as salt but for more randomization
     */
    function importSeedFromThirdSaltSugar(
        uint256 seed,
        uint256 salt,
        uint256 sugar
    ) public view returns (uint8) {
        bytes32 bHash = blockhash(block.number - 1);
        uint8 randomNumber = uint8(uint256(keccak256(abi.encodePacked(block.timestamp, bHash, seed, salt, sugar))) % 100);
        return randomNumber;
    }
}
