// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./IERC5192.sol";

contract SoulSBT is ERC721URIStorage, Ownable, IERC5192 {
    uint256 public nextId = 1;
    mapping(uint256 => bool) private _locked;
    constructor() ERC721("SOUL SBT", "SOULSBT") {}
    function mintTo(address to, string memory tokenURI_) external onlyOwner returns (uint256 tokenId) {
        tokenId = nextId++;
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, tokenURI_);
        _locked[tokenId] = true;
        emit Locked(tokenId);
    }
    function locked(uint256 tokenId) external view override returns (bool) { return _locked[tokenId]; }
    function _beforeTokenTransfer(address from, address to, uint256 tokenId, uint256 batchSize) internal override {
        if (from != address(0) && to != address(0)) revert("SBT: non-transferable");
        super._beforeTokenTransfer(from, to, tokenId, batchSize);
    }
    function approve(address, uint256) public pure override { revert("SBT: approvals disabled"); }
    function setApprovalForAll(address, bool) public pure override { revert("SBT: approvals disabled"); }
}
