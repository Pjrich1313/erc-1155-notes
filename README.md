# ERC-1155 Metadata Standards (EIP-1155)

Optional `uri(uint256 id)` returns a URI to JSON.

**URI rules:**
- May contain `{id}` → clients replace with 64-char lowercase hex token ID (no `0x`, zero-padded).
- Example: `https://.../{id}.json` → `.../000...004cce0.json` for ID `0x4cce0`.

**JSON Schema:**
```json
{
  "name": "string",
  "decimals": integer,
  "description": "string",
  "image": "URI",
  "properties": {}
}
```
`{id}` substitution also allowed inside JSON values.

# EIP-721 vs EIP-1155

| Feature              | ERC-721                          | ERC-1155                              |
|----------------------|----------------------------------|---------------------------------------|
| Token type           | Unique NFTs only (qty=1)        | Fungible / NFT / semi-fungible       |
| Types per contract   | One collection                   | Many types                           |
| Transfers            | Single only                      | Native batch                         |
| Metadata             | `tokenURI(id)`                   | `uri(id)` + `{id}` substitution      |
| Gas efficiency       | Lower for multiples              | Higher (batch ops)                   |
| Best for             | Unique art/collectibles          | Games, editions, mixed assets        |
