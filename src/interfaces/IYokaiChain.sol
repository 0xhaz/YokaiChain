// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.26;

interface IYokaiChain {
    struct Detail {
        uint8 hair;
        uint8 eye;
        uint8 eyebrow;
        uint8 nose;
        uint8 mouth;
        uint8 mark;
        uint8 earrings;
        uint8 accessory;
        uint8 mask;
        uint8 skin;
        uint256 timestamp;
        address creator;
    }

    /// @notice Returns the details associated with a given tokenId
    /// @dev Throws if the token ID is not valid
    /// @param tokenId The ID of the token that represents the NFT
    /// @return detail The details of the NFT
    function details(uint256 tokenId) external view returns (Detail memory detail);
}
