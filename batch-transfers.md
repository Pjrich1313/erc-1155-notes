# ERC-1155 Batch Transfers

```solidity
function safeBatchTransferFrom(
    address from,
    address to,
    uint256[] calldata ids,
    uint256[] calldata values,
    bytes calldata data
) external;
```

- Moves multiple token IDs + amounts in **one** transaction.
- Requires `ids.length == values.length`.
- Caller must be owner or approved operator.
- Emits `TransferBatch`.
- Safe: calls `onERC1155BatchReceived` on contract recipients (must return `0xbc197c81`).
- Significantly cheaper than multiple single transfers.
