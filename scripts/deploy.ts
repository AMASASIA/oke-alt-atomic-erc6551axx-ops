// scripts/deploy.ts
import { ethers } from "hardhat";
async function main(){
  const [deployer] = await ethers.getSigners();
  console.log("Deployer:", deployer.address);

  const SoulSBT = await ethers.getContractFactory("SoulSBT");
  const soul = await SoulSBT.deploy(); await soul.deployed(); console.log("SoulSBT:", soul.address);

  const REGISTRY = process.env.ERC6551_REGISTRY as string;
  const IMPLEMENTATION = process.env.ERC6551_IMPLEMENTATION as string;
  if(!REGISTRY || !IMPLEMENTATION) throw new Error("Missing ERC6551_REGISTRY / ERC6551_IMPLEMENTATION");

  const OkeCard = await ethers.getContractFactory("OkeCard");
  const card = await OkeCard.deploy(REGISTRY, IMPLEMENTATION, soul.address);
  await card.deployed(); console.log("OkeCard:", card.address);

  const SoulPoints = await ethers.getContractFactory("SoulPoints");
  const points = await SoulPoints.deploy(); await points.deployed(); console.log("SoulPoints:", points.address);

  const PluralityScore = await ethers.getContractFactory("PluralityScore");
  const score = await PluralityScore.deploy(points.address);
  await score.deployed(); console.log("PluralityScore:", score.address);
}
main().catch((e)=>{ console.error(e); process.exit(1); });
