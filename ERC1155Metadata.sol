// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title ERC1155 Metadata Extensions
 * @dev Combines base URI + per-token URI storage
 */
contract ERC1155Metadata is ERC1155, ERC1155URIStorage, Ownable {
    constructor(string memory baseURI) 
        ERC1155(baseURI) 
        Ownable(msg.sender) 
    {}

    function uri(uint256 tokenId)
        public
        view
        override(ERC1155, ERC1155URIStorage)
        returns (string memory)
    {
        return super.uri(tokenId);
    }

    function setTokenURI(uint256 tokenId, string memory tokenURI) 
        external 
        onlyOwner 
    {
        _setURI(tokenId, tokenURI);
    }

    function setBaseURI(string memory newBaseURI) 
        external 
        onlyOwner 
    {
        _setBaseURI(newBaseURI);
    }

    // Optional: emit URI event when changing
    function _setURI(uint256 tokenId, string memory newURI) 
        internal 
        override 
    {
        super._setURI(tokenId, newURI);
        emit URI(newURI, tokenId);
    }
}
