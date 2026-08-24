// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/IERC1155Receiver.sol";
import "@openzeppelin/contracts/utils/introspection/ERC165.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

/**
 * @title ERC1155ReceiverExample
 * @notice Minimal ERC-1155 token receiver with reentrancy protection.
 * @dev Implements IERC1155Receiver + ERC-165.
 *      Accepts all incoming single and batch transfers.
 *      nonReentrant on hooks prevents reentrancy during receipt.
 */
contract ERC1155ReceiverExample is ERC165, IERC1155Receiver, ReentrancyGuard {
    /// @notice Handle receipt of a single ERC-1155 token type
    /// @return Selector `0xf23a6e61` to accept the transfer
    function onERC1155Received(
        address /* operator */,
        address /* from */,
        uint256 /* id */,
        uint256 /* value */,
        bytes calldata /* data */
    ) external override nonReentrant returns (bytes4) {
        return this.onERC1155Received.selector;
    }

    /// @notice Handle receipt of multiple ERC-1155 token types
    /// @return Selector `0xbc197c81` to accept the batch transfer
    function onERC1155BatchReceived(
        address /* operator */,
        address /* from */,
        uint256[] calldata /* ids */,
        uint256[] calldata /* values */,
        bytes calldata /* data */
    ) external override nonReentrant returns (bytes4) {
        return this.onERC1155BatchReceived.selector;
    }

    /// @notice ERC-165 interface support
    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC165, IERC165)
        returns (bool)
    {
        return interfaceId == type(IERC1155Receiver).interfaceId
            || super.supportsInterface(interfaceId);
    }
}
