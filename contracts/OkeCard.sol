// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./IERC6551Registry.sol";
import "./SoulSBT.sol";

contract OkeCard is ERC721URIStorage, Ownable {
    uint256 public nextId = 1;
    IERC6551Registry public registry;
    address public tbaImplementation;
    uint256 public chainId;
    SoulSBT public soul;
    mapping(uint256=>address) public tbaOf;
    event AtomicMint(address indexed user, uint256 tokenId, address tba);

    constructor(address _registry,address _impl,address _soul) ERC721("OKE CARD","OKECARD"){
        registry = IERC6551Registry(_registry);
        tbaImplementation=_impl;
        soul = SoulSBT(_soul);
        uint256 _chainId; assembly { _chainId := chainid() } chainId=_chainId;
    }

    function atomicMint(string memory tokenURI_,string memory soulURI_) external returns(uint256,address){
        uint256 tokenId=nextId++;
        _safeMint(msg.sender,tokenId);
        _setTokenURI(tokenId,tokenURI_);
        address tba=registry.createAccount(tbaImplementation,chainId,address(this),tokenId,0,"");
        tbaOf[tokenId]=tba;
        // SBT to TBA and to user
        soul.mintTo(tba,soulURI_);
        soul.mintTo(msg.sender,soulURI_);
        emit AtomicMint(msg.sender,tokenId,tba);
        return (tokenId,tba);
    }
}
