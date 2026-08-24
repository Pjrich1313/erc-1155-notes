# Batch Transfer Logic (`safeBatchTransferFrom`)

1. Check caller is authorized (`from` or approved operator).
2. Require `ids.length == values.length`.
3. Reject `to == address(0)`.
4. For each pair `(id, value)`:
   - Subtract from `from` balance
   - Add to `to` balance
5. Emit `TransferBatch`.
6. If `to` is a contract → call `onERC1155BatchReceived(...)`.
7. Require return value `0xbc197c81` (acceptance).
