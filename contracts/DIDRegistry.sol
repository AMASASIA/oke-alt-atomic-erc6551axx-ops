// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
contract DIDRegistry {
    mapping(string => address) public didOwner;
    event DIDLinked(string did,address owner);
    event DIDUnlinked(string did,address owner);
    function linkDID(string calldata did) external { didOwner[did]=msg.sender; emit DIDLinked(did,msg.sender); }
    function unlinkDID(string calldata did) external { require(didOwner[did]==msg.sender,"not owner"); delete didOwner[did]; emit DIDUnlinked(did,msg.sender); }
    function ownerOf(string calldata did) external view returns(address){ return didOwner[did]; }
}
