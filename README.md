OKE-ALT-ATOMIC
Application Overview

This application implements a flexible minting system that allows you to mint both NFTs and non-transferable Soulbound Tokens (SBTs) in a single transaction.

Environment Setup
1. Install Dependencies

Install all project dependencies.

npm install

2. Compile Smart Contracts

Compile the smart contracts to prepare them for deployment.

npx hardhat compile

3. Deploy to Testnet

Deploy the smart contracts to the Mumbai testnet.

npx hardhat run scripts/deploy.ts --network mumbai


After deployment, copy and paste the displayed contract address into the MINTING_CONTRACT_ADDRESS field inside src/utils/constants.ts.

4. Start the Application

Run the application locally.

npm start


Once these steps are completed, the application will be fully operational, and you will be able to mint NFTs and SBTs on the testnet. This enables end-to-end workflow testing of the entire system.

# oke-alt-atomic-erc6551axx-ops
# OKE-ALT-Atomic Bridge Integration (PR)

This PR integrates the Bridge features (from OKE–ERC6551AXX) into OKE-ALT-Atomic.

## Adds
- ERC-6551 TBA + Atomic NFT/SBT (dual SBT to TBA & user)
- Webhook-based TBA creation + Google Sheets logging
- NFT.Storage integration (production)
- AA/Paymaster gasless campaign

## Deploy
```bash
npm i
cp .env.local.example .env.local
# Fill RPC/keys/6551/Frontend ENV/NFT_STORAGE_KEY/PAYMASTER_RPC/SHEET_ID

npm run compile
npm run deploy:sepolia   # or :mainnet / :polygon



# PR Diff (High-level)
- Added contracts: OkeCard (dual SBT), SoulSBT, SoulPoints, PluralityScore, DIDRegistry, IERC6551Registry, IERC5192
- Added webhook endpoint (pages/api/webhook.ts) for TBA creation + Google Sheets logging
- Added NFT.Storage integration (frontend/lib/storage.ts)
- Added Paymaster support (frontend/lib/paymaster.ts)
- Updated env example with required keys
- Cleaned repo layout and removed unused files (to be matched against current upstream during PR)

OKE: AI-Enhanced Digital Asset Creation Platform

![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)

This application provides a seamless and intelligent experience for creating unique digital assets on the blockchain. It leverages AI to generate rich metadata and provides a flexible minting flow for NFTs and Soul-Bound Tokens (SBTs), all powered by a robust, consolidated application architecture designed for a resilient user experience.

## Key Features

-   **Consolidated Minting Workflow:** Clicking "Mint" launches a single "AI Minting Preparation Modal" that handles the entire process, from a one-time API key setup to wallet connection and the final transaction.
-   **One-Time In-Browser API Key Setup:** Users are prompted to enter their Gemini and NFT.Storage keys once. These are then stored securely in the browser's local storage for all future use.
-   **AI-Powered Metadata:** Uses the Gemini API to automatically generate creative names and descriptions for assets based on the file type and an optional voice input.
-   **Flexible NFT + SBT Minting:** Mints a standard ERC-721 NFT, a non-transferable "Proof of Creation" SBT, or both in a single, gas-efficient transaction based on user selection from a decoupled UI.
-   **Simulated Cross-Chain Transfers:** Each NFT card features a "Wave 🌊" button, initiating a simulated cross-chain transfer to various testnets.
-   **ERC-6551 Token Bound Accounts (TBA):** Automatically computes the ERC-6551 Token Bound Account address for each minted NFT.
-   **Resilient User Experience:** Built with a centralized state management system that persists user progress through page reloads, ensuring a smooth, uninterrupted workflow.
-   **Featured NFT Showcase:** Includes a dedicated page to showcase a featured NFT, "Vert: MIDORI NFT / SBT", with options for sharing and downloading.

## Technology Stack

-   **Frontend:** React, TypeScript, TailwindCSS, Vite
-   **State Management:** React Context API with a `useReducer` pattern
-   **Blockchain Interaction:** `ethers.js`
-   **Smart Contracts:** Solidity, Hardhat, OpenZeppelin (`OkeMinter.sol`)
-   **AI Services:** Google Gemini API (`@google/genai`)
-   **Decentralized Storage:** NFT.Storage (IPFS)
-   **Browser Persistence:** IndexedDB for files, Local Storage for API keys.

---

## Project Structure

```
/
├── public/          # Static assets
├── src/
│   ├── components/  # Reusable React components
│   ├── context/     # Global state management
│   ├── services/    # External API services (Gemini)
│   └── utils/       # Helper functions (web3, IPFS, API Keys)
├── contracts/       # Solidity smart contracts (OkeMinter.sol)
├── scripts/         # Deployment scripts
├── index.html       # Main HTML entry point
├── vite.config.ts   # Vite configuration
└── ...
```

---

## Getting Started

### Prerequisites

-   Node.js and npm (or a compatible package manager).
-   A browser wallet that supports the Mumbai testnet (e.g., MetaMask).
-   Test MATIC on the Mumbai network for gas fees.
-   API Keys for **Google Gemini** and **NFT.Storage**.

### 1. Backend: Smart Contract Deployment

The `OkeMinter.sol` smart contract needs to be deployed to the Mumbai testnet.

1.  **Install Dependencies:**
    ```bash
    npm install
    ```

2.  **Set Up Contract Environment Variables:**
    Create a `.env` file in the root directory and add the following, replacing the placeholder values:
    ```
    # .env

    # Your Mumbai RPC endpoint URL
    MUMBAI_RPC_URL="https://rpc-mumbai.maticvigil.com"

    # Your private key for the deployment wallet
    PRIVATE_KEY="YOUR_WALLET_PRIVATE_KEY"

    # Optional: Polygonscan API key for verification
    POLYGONSCAN_API_KEY="YOUR_POLYGONSCAN_API_KEY"
    ```

3.  **Compile & Deploy:**
    ```bash
    npx hardhat compile
    npx hardhat run scripts/deploy.ts --network mumbai
    ```

4.  **Update Contract Address:**
    After deployment, the console will output the new contract address. Copy this and paste it into `src/utils/constants.ts`:

    ```typescript
    // src/utils/constants.ts
    export const OKE_MINTER_ADDRESS = "YOUR_NEWLY_DEPLOYED_CONTRACT_ADDRESS";
    ```

### 2. Frontend: Running the Application

1.  **Start the development server:**
    ```bash
    npm run dev
    ```
2.  Open your browser to the local address provided by Vite.

3.  **First-Time API Key Setup:**
    -   The first time you attempt to mint an asset, the "AI Minting Preparation Modal" will appear.
    -   You will be prompted to enter your **Gemini API Key** and your **NFT.Storage API Key**.
    -   These keys are stored securely in your browser's local storage and will be used for all subsequent minting operations. You will not need to enter them again unless you clear your browser's data.

//
# OKE-ALT-ATOMIC

## アプリケーション概要
このアプリケーションは、NFTと譲渡不可能なソウルバウンドトークン（SBT）の両方を単一のトランザクションでミントできる、柔軟なミントシステムを実装しています。

## 環境セットアップ

### 1. 依存関係のインストール
プロジェクトのすべての依存関係をインストールします。
`npm install`

### 2. スマートコントラクトのコンパイル
スマートコントラクトをコンパイルして、デプロイの準備をします。
`npx hardhat compile`

### 3. テストネットへのデプロイ
スマートコントラクトをMumbaiテストネットにデプロイします。
`npx hardhat run scripts/deploy.ts --network mumbai`

デプロイ後、表示されるコントラクトアドレスを `src/utils/constants.ts` ファイルの `MINTING_CONTRACT_ADDRESS` にコピー＆ペーストしてください。

### 4. アプリケーションの起動
ローカルでアプリケーションを起動します。
`npm start`

これで、アプリケーションは完全に動作し、テストネット上でNFTとSBTのミントを実行できるようになります。
これらのステップを完了することで、アプリケーションは完全に機能し、エンドツーエンドのワークフローをテストできるようになります。


# OKE-ALT-Atomic Bridge 統合（PR用）

本PRは、`OKE–ERC6551AXX` のブリッジ拡張を `OKE-ALT-Atomic` に統合します。

## 追加点
- ERC-6551 TBA + NFT/SBT 同時発行（TBA & ユーザーの両方にSBT）
- Webhookでの TBA 自動生成 + Google Sheets 記帳
- NFT.Storage 連携（本番運用想定）
- AA/Paymaster（ガス無料キャンペーン）

## デプロイ
```bash
npm i
cp .env.local.example .env.local
# RPC/鍵/6551/フロントENV/NFT_STORAGE_KEY/PAYMASTER_RPC/SHEET_ID を設定

npm run compile
npm run deploy:sepolia     # or :mainnet / :polygon
```

## 注意
- 6551実装アドレスはチェーン毎に要設定。
- 本PRは構成整理と最小差分化のため、未使用ファイルを削除しています。
