// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.26;

import {ERC721Enumerable, ERC721} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {ReentrancyGuard} from "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import {IYokaiChain} from "./interfaces/IYokaiChain.sol";
import {IYokaiChainDescriptor} from "./interfaces/IYokaiChainDescriptor.sol";

contract YokaiChain is ERC721Enumerable, Ownable, IYokaiChain, ReentrancyGuard {
    /// @dev Price for one Yokai
    uint256 public unitPrice = 18 ether;

    /// @dev if the mint is enabled
    bool public mintEnabled = false;

    /// @dev The token ID Yokai
    mapping(uint256 => Detail) private _detail;

    /// @dev The address of the token descriptor contract, which handles generating token URIs
    address private immutable _tokenDescriptor;

    constructor(address tokenDescriptor_) ERC721("YokaiChain", "YOKAI") Ownable(msg.sender) {
        _tokenDescriptor = tokenDescriptor_;
    }

    /// @dev save bytecode by removing implementation of unused method
    function _baseURI() internal view virtual override returns (string memory) {}

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        require(ownerOf(tokenId) != address(0), "ERC721: tokenURI query for nonexistent token");
        return IYokaiChainDescriptor(_tokenDescriptor).tokenURI(this, tokenId);
    }

    /// @notice Create random Yokai
    /// @param qty The quantity of Yokai to mint
    function create(uint256 qty) public payable nonReentrant {
        require(mintEnabled, "YokaiChain: mint is disabled");
        require(msg.value >= unitPrice * qty, "YokaiChain: insufficient funds");
        require(totalSupply() + qty <= 8753, "YokaiChain: exceeds maximum supply");
        require(qty <= 10, "YokaiChain: qty must be less than or equal to 10");
        require(msg.value >= unitPrice * qty, "YokaiChain: insufficient funds");

        for (uint256 i; i < qty; i++) {
            uint256 seed = block.timestamp << (i + 1);
            uint256 nextTokenId = totalSupply() + 1;
            Detail memory newDetail = Detail({
                hair: IYokaiChainDescriptor(_tokenDescriptor).generateHairId(nextTokenId, seed),
                eye: IYokaiChainDescriptor(_tokenDescriptor).generateEyeId(nextTokenId, seed),
                eyebrow: IYokaiChainDescriptor(_tokenDescriptor).generateEyebrowId(nextTokenId, seed),
                nose: IYokaiChainDescriptor(_tokenDescriptor).generateNoseId(nextTokenId, seed),
                mouth: IYokaiChainDescriptor(_tokenDescriptor).generateMouthId(nextTokenId, seed),
                mark: IYokaiChainDescriptor(_tokenDescriptor).generateMarkId(nextTokenId, seed),
                earrings: IYokaiChainDescriptor(_tokenDescriptor).generateEarringsId(nextTokenId, seed),
                accessory: IYokaiChainDescriptor(_tokenDescriptor).generateAccessoryId(nextTokenId, seed),
                mask: IYokaiChainDescriptor(_tokenDescriptor).generateMaskId(nextTokenId, seed),
                skin: IYokaiChainDescriptor(_tokenDescriptor).generateSkinId(nextTokenId, seed),
                timestamp: block.timestamp,
                creator: msg.sender
            });
            _detail[nextTokenId] = newDetail;
            _safeMint(msg.sender, nextTokenId);
        }
    }

    /// @notice Send funds from sales to the team
    function withdrawAll() public {
        uint256 amount = address(this).balance;
        require(payable(owner()).send(amount));
    }

    /// @inheritdoc IYokaiChain
    function details(uint256 tokenId) external view override returns (Detail memory detail) {
        detail = _detail[tokenId];
    }

    /// @notice Update the price of one Yokai
    function updatePrice(uint256 unitPrice_) external onlyOwner {
        require(unitPrice_ <= 18 ether, "YokaiChain: price must be less than or equal to 18 ether");
        unitPrice = unitPrice_;
    }
}
