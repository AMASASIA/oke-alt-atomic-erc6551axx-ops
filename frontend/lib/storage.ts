import { NFTStorage, File } from "nft.storage";
export async function uploadToNFTStorage(name:string, description:string, imageFile:File){
  const client=new NFTStorage({token:process.env.NFT_STORAGE_KEY!});
  const metadata=await client.store({name, description, image:imageFile});
  return `ipfs://${metadata.ipnft}`;
}