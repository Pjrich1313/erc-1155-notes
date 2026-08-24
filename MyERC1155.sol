// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract MyERC1155 is ERC1155 {
    constructor() ERC1155("https://api.example.com/metadata/{id}.json") {}

    // Optional: override to customize per-token or dynamic URI
    function uri(uint256 id) public view virtual override returns (string memory) {
        return string(abi.encodePacked(
            "https://api.example.com/metadata/",
            _toString(id),
            ".json"
        ));
    }

    // Helper for uint to string (or use OpenZeppelin Strings)
    function _toString(uint256 value) internal pure returns (string memory) {
        if (value == 0) return "0";
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }
}
