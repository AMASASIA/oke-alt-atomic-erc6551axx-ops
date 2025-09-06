import { ethers } from "ethers";
import { google } from "googleapis";
export default async function handler(req,res){
  const { tokenId }=req.body;
  const provider=new ethers.JsonRpcProvider(process.env.SEPOLIA_RPC);
  const wallet=new ethers.Wallet(process.env.PRIVATE_KEY!,provider);
  const registry=new ethers.Contract(process.env.ERC6551_REGISTRY!,["function createAccount(address,uint256,address,uint256,uint256,bytes) returns(address)"],wallet);
  const tba=await registry.createAccount(process.env.ERC6551_IMPLEMENTATION,11155111,process.env.NEXT_PUBLIC_OKECARD_ADDRESS,tokenId,0,"0x");
  const sheets=google.sheets("v4");
  await sheets.spreadsheets.values.append({ spreadsheetId:process.env.SHEET_ID, range:"TBA!A1", valueInputOption:"RAW", requestBody:{ values:[[tokenId,tba]] } });
  res.json({success:true,tba});
}