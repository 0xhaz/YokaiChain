// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.26;

import {IYokaiChain} from "src/interfaces/IYokaiChain.sol";

interface IYokaiChainDescriptor {
    /// @notice Produces the URI describing the given token ID
    /// @dev Note this URI may be a data: URI with JSON contents directly inlined
    /// @param yokaiChain The yokaiChain contract
    /// @param tokenId The ID of the token for which to produce a description
    /// @return the URI of the ERC721 compliant metadata
    function tokenURI(IYokaiChain yokaiChain, uint256 tokenId) external view returns (string memory);

    /// @notice Generate randomly an ID for the hair item
    /// @param tokenId the current tokenId
    /// @param seed Used for the initialization of the number generator
    /// @return the hair item ID
    function generateHairId(uint256 tokenId, uint256 seed) external view returns (uint8);

    /// @notice Generate randomly an ID for the eye item
    /// @param tokenId the current tokenId
    /// @param seed Used for the initialization of the number generator
    /// @return the eye item ID
    function generateEyeId(uint256 tokenId, uint256 seed) external view returns (uint8);

    /// @notice Generate randomly an ID for the eyebrow item
    /// @param tokenId the current tokenId
    /// @param seed Used for the initialization of the number generator
    /// @return the eyebrow item ID
    function generateEyebrowId(uint256 tokenId, uint256 seed) external view returns (uint8);

    /// @notice Generate randomly an ID for the nose item
    /// @param tokenId the current tokenId
    /// @param seed Used for the initialization of the number generator
    /// @return the nose item ID
    function generateNoseId(uint256 tokenId, uint256 seed) external view returns (uint8);

    /// @notice Generate randomly an ID for the mouth item
    /// @param tokenId the current tokenId
    /// @param seed Used for the initialization of the number generator
    /// @return the mouth item ID
    function generateMouthId(uint256 tokenId, uint256 seed) external view returns (uint8);

    /// @notice Generate randomly an ID for the mark item
    /// @param tokenId the current tokenId
    /// @param seed Used for the initialization of the number generator
    /// @return the mark item ID
    function generateMarkId(uint256 tokenId, uint256 seed) external view returns (uint8);

    /// @notice Generate randomly an ID for the earring item
    /// @param tokenId the current tokenId
    /// @param seed Used for the initialization of the number generator
    /// @return the earring item ID
    function generateEarringsId(uint256 tokenId, uint256 seed) external view returns (uint8);

    /// @notice Generate randomly an ID for the accessory item
    /// @param tokenId the current tokenId
    /// @param seed Used for the initialization of the number generator
    /// @return the accessory item ID
    function generateAccessoryId(uint256 tokenId, uint256 seed) external view returns (uint8);

    /// @notice Generate randomly an ID for the mask item
    /// @param tokenId the current tokenId
    /// @param seed Used for the initialization of the number generator
    /// @return the mask item ID
    function generateMaskId(uint256 tokenId, uint256 seed) external view returns (uint8);

    /// @notice Generate randomly an ID for the skin item
    /// @param tokenId the current tokenId
    /// @param seed Used for the initialization of the number generator
    /// @return the skin item ID
    function generateSkinId(uint256 tokenId, uint256 seed) external view returns (uint8);
}
