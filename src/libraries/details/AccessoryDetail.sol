// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.26;

import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";
import {Colors} from "./constants/Colors.sol";

library AccessoryDetail {
    /// @dev Accessory N°1 => None
    function item_1() public pure returns (string memory) {
        return base("", "None");
    }

    /// @dev Accessory N°2 => Horn Blood
    function item_2() public pure returns (string memory) {
        return base(horn("E31466"), "Horn Blood");
    }

    /// @dev Accessory N°3 => Small Horn Blood
    function item_3() public pure returns (string memory) {
        return base(small_horn("E31466"), "Small Horn Blood");
    }

    /// @dev Accessory N°4 => Monk Blood
    function item_4() public pure returns (string memory) {
        return base(monk("B50D5E"), "Monk Blood");
    }

    /// @dev Accessory N°5 => Horn Moon
    function item_5() public pure returns (string memory) {
        return base(horn("2A2C38"), "Horn Moon");
    }

    /// @dev Accessory N°6 => Small Horn Moon
    function item_6() public pure returns (string memory) {
        return base(small_horn("2A2C38"), "Small Horn Moon");
    }

    /// @dev Accessory N°7 => Monk Moon
    function item_7() public pure returns (string memory) {
        return base(monk("242630"), "Monk Moon");
    }

    function small_horn(string memory color) private pure returns (string memory) {
        return string(
            abi.encodePacked(
                abi.encodePacked(
                    '<g display="inline" ><path  fill="#',
                    color,
                    '" stroke="#000000" stroke-miterlimit="10" d="M257.5,100.7c0,0,10.6-0.7,16.6-12.7c0,0,6.3,10.6-5.2,25.1C263.4,110.3,259.4,106.1,257.5,100.7z" /><path  fill="#',
                    color,
                    '" stroke="#',
                    color,
                    '" stroke-miterlimit="10" d="M258.2,101.1c0,0.1,1,9.2,10.6,11.4" /></g>'
                ),
                abi.encodePacked(
                    '<g display="inline" ><path  fill="#',
                    color,
                    '" stroke="#000000" stroke-miterlimit="10" d="M159.4,101.6c0,0-10.6-0.7-16.6-12.7c0,0-6.3,10.6,5.2,25.1C153.4,111.2,157.5,107,159.4,101.6z" /><path  fill="#',
                    color,
                    '" stroke="#',
                    color,
                    '" stroke-miterlimit="10" d="M158.9,102c0,0.1-1.5,9.4-10.7,11.3" /></g>'
                )
            )
        );
    }

    function horn(string memory color) private pure returns (string memory) {
        return string(
            abi.encodePacked(
                '<g><path d="M255.6,94.5s36.9-18,49.2-42.8c0,0-1.8,38.5-25.6,68.6C267.8,114.5,259.6,105.9,255.6,94.5Z" transform="translate(0 0.5)" fill="#',
                color,
                '" stroke="#000" stroke-miterlimit="10" /> <path d="M256.7,94.8c-.1.2,4.3,18.1,22.8,24.4" transform="translate(0 0.5)" fill="none" stroke="#',
                color,
                '" stroke-miterlimit="10" stroke-width="2"/> </g> <g> <path d="M160.5,94s-36.9-18.1-49.2-43c0,0,1.8,38.6,25.6,68.9C148.3,114.1,156.5,105.4,160.5,94Z" transform="translate(0 0.5)" fill="#',
                color,
                '" stroke="#000" stroke-miterlimit="10" /> <path d="M159.7,94.1c.1.2-5.1,19-22.9,24.5" transform="translate(0 0.5)" fill="none" stroke="#',
                color,
                '" stroke-miterlimit="10" stroke-width="2"/></g>'
            )
        );
    }

    function monk(string memory color) private pure returns (string memory) {
        return string(
            abi.encodePacked(
                abi.encodePacked(
                    '<g display="inline" ><path fill="#',
                    color,
                    '" stroke="#000000" stroke-width="2" stroke-miterlimit="10" d="M271.3,310.1c0,0-0.5-4.7-8.1-5.9l0.3,4.6C263.5,308.8,268.8,308.5,271.3,310.1z" /><ellipse transform="matrix(0.9951 -9.859076e-02 9.859076e-02 0.9951 -30.1289 27.6785)" fill="#',
                    color,
                    '" stroke="#000000" stroke-width="1.9991" stroke-miterlimit="10.001" cx="265" cy="318.7" rx="10" ry="10.1" /><ellipse transform="matrix(0.9951 -9.868323e-02 9.868323e-02 0.9951 -30.7637 26.2227)" fill="#',
                    color,
                    '" stroke="#000000" stroke-width="1.9993" stroke-miterlimit="10.0012" cx="249.7" cy="324.1" rx="10" ry="10.1" /><ellipse transform="matrix(0.9952 -9.784912e-02 9.784912e-02 0.9952 -30.1289 18.0538)" fill="#',
                    color,
                    '" stroke="#000000" stroke-width="2" stroke-miterlimit="10.0039" cx="169" cy="316.2" rx="10" ry="10.1" />'
                ),
                abi.encodePacked(
                    '<ellipse transform="matrix(0.9952 -9.784608e-02 9.784608e-02 0.9952 -30.8049 19.4498)" fill="#',
                    color,
                    '" stroke="#000000" stroke-width="2" stroke-miterlimit="10.0039" cx="182.9" cy="323.8" rx="10" ry="10.1" /><ellipse transform="matrix(0.9952 -9.784740e-02 9.784740e-02 0.9952 -31.1502 21.0167)" fill="#',
                    color,
                    '" stroke="#000000" stroke-width="2" stroke-miterlimit="10.0039" cx="198.7" cy="328.1" rx="10" ry="10.1" />'
                ),
                abi.encodePacked(
                    '<ellipse transform="matrix(0.9952 -9.784740e-02 9.784740e-02 0.9952 -31.1875 22.6565)" fill="#',
                    color,
                    '" stroke="#000000" stroke-width="2" stroke-miterlimit="10.0039" cx="215.4" cy="329.3" rx="10" ry="10.1" /><ellipse transform="matrix(0.9952 -9.784871e-02 9.784871e-02 0.9952 -30.9209 24.3013)" fill="#',
                    color,
                    '" stroke="#000000" stroke-width="2" stroke-miterlimit="10.0039" cx="232.3" cy="327.4" rx="10" ry="10.1" /><ellipse transform="matrix(0.9952 -9.784740e-02 9.784740e-02 0.9952 -31.1875 22.6565)" fill="#',
                    color,
                    '" stroke="#000000" stroke-width="2" stroke-miterlimit="10.0039" cx="215.4" cy="329.3" rx="10" ry="10.1" /><path fill="#',
                    color,
                    '" stroke="#000000" stroke-width="2" stroke-miterlimit="10" d="M167.5,306.1c0,0,3-4.2,7.1-3.6l-0.5,4.7C174.2,307.2,171.4,305.5,167.5,306.1z" /></g><g display="inline" ><ellipse transform="matrix(0.5209 -0.8536 0.8536 0.5209 -193.8937 295.0872)" opacity="0.54"  enable-background="new    " cx="165.9" cy="320.3" rx="3.1" ry="5.1" /><ellipse transform="matrix(0.3023 -0.9532 0.9532 0.3023 -186.8647 402.0681)" opacity="0.54"  enable-background="new    " cx="181.2" cy="328.7" rx="2.9" ry="5.3" /><ellipse transform="matrix(8.016321e-02 -0.9968 0.9968 8.016321e-02 -149.6992 503.476)" opacity="0.54"  enable-background="new    " cx="197.9" cy="332.8" rx="3.1" ry="5.5" /><ellipse transform="matrix(1.864555e-02 -0.9998 0.9998 1.864555e-02 -123.3718 543.6663)" opacity="0.54"  enable-background="new    " cx="215.3" cy="334.7" rx="2.6" ry="5.6" /><ellipse transform="matrix(0.9869 -0.1616 0.1616 0.9869 -50.6334 42.0687)" opacity="0.54"  enable-background="new    " cx="233.3" cy="332.3" rx="5.3" ry="3.1" /><ellipse transform="matrix(0.9587 -0.2843 0.2843 0.9587 -83.2092 85.1148)" opacity="0.54"  enable-background="new    " cx="251.6" cy="329.2" rx="5.3" ry="3.1" /><ellipse transform="matrix(0.8562 -0.5167 0.5167 0.8562 -127.9572 184.9349)" opacity="0.54"  enable-background="new    " cx="268.2" cy="322.3" rx="5.6" ry="3.1" /></g>'
                )
            )
        );
    }

    /// @dev The base SVG for the body
    function base(string memory children, string memory name) private pure returns (string memory) {
        return string(abi.encodePacked('<g id="accessory"><g id="', name, '">', children, "</g></g>"));
    }
}
