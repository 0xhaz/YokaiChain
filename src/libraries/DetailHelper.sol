// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.26;

import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";
import {SafeCast} from "@openzeppelin/contracts/utils/math/SafeCast.sol";

library DetailHelper {
    /// @notice Call the library item function
    /// @param lib The library address
    /// @param id The item id
    function getDetailSVG(address lib, uint8 id) internal view returns (string memory) {
        (bool success, bytes memory data) =
            lib.staticcall(abi.encodeWithSignature(string(abi.encodePacked("item_", Strings.toString(id), "()"))));

        require(success, "DetailHelper: getDetailSVG failed");
        return abi.decode(data, (string));
    }

    /// @notice Generate a random number and return the index from the corresponding interval
    /// @param max The maximum value to generate
    /// @param seed Used for the initialization of the number generator
    /// @param intervals The intervals to choose from
    /// @param selector Caller selector
    /// @param tokenId the current tokenId
    function generate(uint256 max, uint256 seed, uint256[] memory intervals, bytes4 selector, uint256 tokenId)
        internal
        view
        returns (uint8)
    {
        uint256 generated = generateRandom(max, seed, tokenId, selector);
        return pickItems(generated, intervals);
    }

    /// @notice Generate random number between 1 and max
    /// @param max Maximum value of the random number
    /// @param seed Used for the initialization of the number generator
    /// @param tokenId Current tokenId used as seed
    /// @param selector Caller selector used as seed
    function generateRandom(uint256 max, uint256 seed, uint256 tokenId, bytes4 selector)
        private
        view
        returns (uint256)
    {
        return (
            uint256(
                keccak256(
                    abi.encodePacked(block.prevrandao, block.number, tx.origin, tx.gasprice, selector, seed, tokenId)
                )
            ) % (max + 1)
        ) + 1;
    }

    /// @notice Pick an item for the given random value
    /// @param val The random value
    /// @param intervals The intervals for the corresponding items
    /// @return the item ID where: intervals[] index + 1 = item ID
    function pickItems(uint256 val, uint256[] memory intervals) internal pure returns (uint8) {
        for (uint256 i; i < intervals.length; i++) {
            if (val > intervals[i]) {
                return SafeCast.toUint8(i + 1);
            }
        }
        revert("DetailHelper: pickItems failed");
    }
}
