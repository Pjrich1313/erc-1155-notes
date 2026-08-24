// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155URIStorage.sol";

/**
 * @title ERC1155 with Metadata URI Extension
 * @dev Uses ERC1155URIStorage for per-token URI support
 */
contract MyERC1155Metadata is ERC1155, ERC1155URIStorage {
    constructor(string memory baseURI) ERC1155(baseURI) {}

    function uri(uint256 tokenId)
        public
        view
        override(ERC1155, ERC1155URIStorage)
        returns (string memory)
    {
        return super.uri(tokenId);
    }

    // Optional: set individual token URI
    function setTokenURI(uint256 tokenId, string memory tokenURI) external {
        _setURI(tokenId, tokenURI);
    }

    // Optional: update base URI
    function setBaseURI(string memory newBaseURI) external {
        _setBaseURI(newBaseURI);
    }
}
