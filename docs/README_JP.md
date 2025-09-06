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
