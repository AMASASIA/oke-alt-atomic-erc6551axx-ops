import { ethers } from "ethers";
export async function sendWithPaymaster(txData:any){
  const provider=new ethers.JsonRpcProvider(process.env.PAYMASTER_RPC!);
  const signer=provider.getSigner();
  return signer.sendTransaction(txData);
}