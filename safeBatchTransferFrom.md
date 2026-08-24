# safeBatchTransferFrom

```solidity
function safeBatchTransferFrom(
    address from,
    address to,
    uint256[] calldata ids,
    uint256[] calldata values,
    bytes calldata data
) external;
```

**Rules**
- `ids.length == values.length`
- Caller must be `from` or approved operator
- Reverts if any balance insufficient or `to == address(0)`
- Emits `TransferBatch`
- If `to` is a contract, calls `onERC1155BatchReceived` and requires return value `0xbc197c81`

**Recommended protection**
Wrap with `nonReentrant` in your ERC1155 implementation:

```solidity
function safeBatchTransferFrom(
    address from,
    address to,
    uint256[] calldata ids,
    uint256[] calldata values,
    bytes calldata data
) public virtual override nonReentrant {
    // ... standard checks and transfer logic
}
```
