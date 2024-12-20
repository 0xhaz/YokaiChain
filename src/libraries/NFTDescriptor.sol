// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.26;

import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";
import {BackgroundDetail} from "src/libraries/details/BackgroundDetail.sol";
import {BodyDetail} from "src/libraries/details/BodyDetail.sol";
import {HairDetail} from "src/libraries/details/HairDetail.sol";
import {MouthDetail} from "src/libraries/details/MouthDetail.sol";
import {NoseDetail} from "src/libraries/details/NoseDetail.sol";
import {EyesDetail} from "src/libraries/details/EyesDetail.sol";
import {EyebrowDetail} from "src/libraries/details/EyebrowDetail.sol";
import {MarkDetail} from "src/libraries/details/MarkDetail.sol";
import {AccessoryDetail} from "src/libraries/details/AccessoryDetail.sol";
import {EarringsDetail} from "src/libraries/details/EarringsDetail.sol";
import {MaskDetail} from "src/libraries/details/MaskDetail.sol";
import {DetailHelper} from "src/libraries/DetailHelper.sol";

library NFTDescriptor {
    struct SVGParams {
        uint8 hair;
        uint8 eye;
        uint8 eyebrow;
        uint8 nose;
        uint8 mouth;
        uint8 mark;
        uint8 earring;
        uint8 accessory;
        uint8 mask;
        uint8 background;
        uint8 skin;
        uint256 timestamp;
        address creator;
    }

    /// @dev Combine all the SVGs to generate the final image
    function generateSVGImage(SVGParams memory params) internal view returns (string memory) {
        return string(
            abi.encodePacked(
                generateSVGHead(),
                DetailHelper.getDetailSVG(address(BackgroundDetail), params.background),
                generateSVGFace(params),
                DetailHelper.getDetailSVG(address(EarringsDetail), params.earring),
                DetailHelper.getDetailSVG(address(HairDetail), params.hair),
                DetailHelper.getDetailSVG(address(AccessoryDetail), params.accessory),
                DetailHelper.getDetailSVG(address(MaskDetail), params.mask),
                "</svg>"
            )
        );
    }

    /// @dev Generate the SVG header
    function generateSVGHead() private pure returns (string memory) {
        return string(
            abi.encodePacked(
                '<svg version="1.1" xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" xmlns:xlink="http://www.w3.org/1999/xlink"',
                ' viewBox="0 0 420 420" style="enable-background:new 0 0 420 420;" xml:space="preserve">'
            )
        );
    }

    /// @dev Generate the SVG face
    function generateSVGFace(SVGParams memory params) private view returns (string memory) {
        return string(
            abi.encodePacked(
                DetailHelper.getDetailSVG(address(BodyDetail), params.skin),
                DetailHelper.getDetailSVG(address(MarkDetail), params.mark),
                DetailHelper.getDetailSVG(address(MouthDetail), params.mouth),
                DetailHelper.getDetailSVG(address(NoseDetail), params.nose),
                DetailHelper.getDetailSVG(address(EyesDetail), params.eye),
                DetailHelper.getDetailSVG(address(EyebrowDetail), params.eyebrow)
            )
        );
    }

    /// @dev generate Json Metadata name
    function generateName(SVGParams memory params, uint256 tokenId) internal pure returns (string memory) {
        return string(
            abi.encodePacked(BackgroundDetail.getItemNameById(params.background), " Yoki ", Strings.toString(tokenId))
        );
    }

    /// @dev generate Json Metadata description
    function generateDescription(SVGParams memory params) internal pure returns (string memory) {
        return string(
            abi.encodePacked(
                "Generated by ",
                Strings.toHexString(uint256(uint160(params.creator))),
                " at ",
                Strings.toString(params.timestamp)
            )
        );
    }

    /// @dev generate Json Metadata attributes
    function generateAttributes(SVGParams memory params) internal pure returns (string memory) {
        return string(
            abi.encodePacked(
                "[",
                getJsonAttribute("Body", BodyDetail.getItemNameById(params.skin), false),
                getJsonAttribute("Hair", HairDetail.getItemNameById(params.hair), false),
                getJsonAttribute("Mouth", MouthDetail.getItemNameById(params.mouth), false),
                getJsonAttribute("Nose", NoseDetail.getItemNameById(params.nose), false),
                getJsonAttribute("Eyes", EyesDetail.getItemNameById(params.eye), false),
                getJsonAttribute("Eyebrow", EyebrowDetail.getItemNameById(params.eyebrow), false),
                abi.encodePacked(
                    getJsonAttribute("Mark", MarkDetail.getItemNameById(params.mark), false),
                    getJsonAttribute("Accessory", AccessoryDetail.getItemNameById(params.accessory), false),
                    getJsonAttribute("Earrings", EarringsDetail.getItemNameById(params.earring), false),
                    getJsonAttribute("Mask", MaskDetail.getItemNameById(params.mask), false),
                    getJsonAttribute("Background", BackgroundDetail.getItemNameById(params.background), true),
                    "]"
                )
            )
        );
    }

    /// @dev Get the JSON attribute as
    /// {"trait_type": "Body", "value": "Skin 1"}
    function getJsonAttribute(string memory trait, string memory value, bool end)
        private
        pure
        returns (string memory json)
    {
        return string(abi.encodePacked('{ "trait_type" : "', trait, '", "value" : "', value, '" }', end ? "" : ","));
    }
}
