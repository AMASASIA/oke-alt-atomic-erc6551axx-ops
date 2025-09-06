// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
contract SoulPoints {
    struct Contribution { uint256 points; uint256 lastUpdate; uint256 frequency; }
    mapping(address => Contribution) public contributions;
    event Contributed(address indexed user, uint256 points, uint256 total);
    function addContribution(address user, uint256 points) external {
        Contribution storage c = contributions[user];
        c.points += points; c.frequency += 1; c.lastUpdate = block.timestamp;
        emit Contributed(user, points, c.points);
    }
    function getRFM(address user) external view returns (uint256 recency, uint256 frequency, uint256 monetary) {
        Contribution memory c = contributions[user];
        recency = c.lastUpdate == 0 ? type(uint256).max : (block.timestamp - c.lastUpdate);
        frequency = c.frequency; monetary = c.points;
    }
}
