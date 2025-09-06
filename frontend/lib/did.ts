export function didFromAddress(address: string, chainId: number, ns = process.env.NEXT_PUBLIC_DID_NAMESPACE || "did:pkh:eip155") {
  return `${ns}:${chainId}:${address}`;
}