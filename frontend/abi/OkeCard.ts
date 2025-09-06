export const OKECARD_ABI = [
  { "inputs": [
      { "internalType": "address", "name": "_registry", "type": "address" },
      { "internalType": "address", "name": "_tbaImplementation", "type": "address" },
      { "internalType": "address", "name": "_soulSbt", "type": "address" }
    ], "stateMutability": "nonpayable", "type": "constructor" },
  { "inputs": [
      { "internalType": "string", "name": "tokenURI_", "type": "string" },
      { "internalType": "string", "name": "soulURI_", "type": "string" }
    ], "name": "atomicMint", "outputs": [
      { "internalType": "uint256", "name": "tokenId", "type": "uint256" },
      { "internalType": "address", "name": "tba", "type": "address" }
    ], "stateMutability": "nonpayable", "type": "function" }
];