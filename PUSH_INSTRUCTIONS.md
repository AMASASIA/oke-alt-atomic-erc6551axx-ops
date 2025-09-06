# How to Push This PR to AMASASIA/OKE-ALT-Atomic

```bash
# 1) Clone upstream
git clone https://github.com/AMASASIA/OKE-ALT-Atomic.git
cd OKE-ALT-Atomic

# 2) Create PR branch
git checkout -b feature/bridge-integration

# 3) Copy all files from this package into repo root
# (unzip the ZIP and copy its contents here, overwriting where needed)

# 4) Review & commit
git add -A
git commit -m "feat: integrate Bridge version (ERC-6551 AXX) — dual SBT, webhook + sheets, NFT.Storage, paymaster"

# 5) Push and open PR
git push origin feature/bridge-integration
# Then open a PR on GitHub comparing feature/bridge-integration -> main
```
