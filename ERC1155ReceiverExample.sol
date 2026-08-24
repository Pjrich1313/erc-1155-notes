// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/IERC1155Receiver.sol";
import "@openzeppelin/contracts/utils/introspection/ERC165.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

/**
 * @dev Example receiver with ReentrancyGuard on hooks.
 * Note: nonReentrant on receive hooks protects against reentrancy
 * during token acceptance. Do not mark pure/view.
 */
contract ERC1155ReceiverExample is ERC165, IERC1155Receiver, ReentrancyGuard {
    function onERC1155Received(
        address,
        address,
        uint256,
        uint256,
        bytes calldata
    ) external override nonReentrant returns (bytes4) {
        return this.onERC1155Received.selector; // 0xf23a6e61
    }

    function onERC1155BatchReceived(
        address,
        address,
        uint256[] calldata,
        uint256[] calldata,
        bytes calldata
    ) external override nonReentrant returns (bytes4) {
        return this.onERC1155BatchReceived.selector; // 0xbc197c81
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC165, IERC165)
        returns (bool)
    {
        return
            interfaceId == type(IERC1155Receiver).interfaceId ||
            super.supportsInterface(interfaceId);
    }
}
