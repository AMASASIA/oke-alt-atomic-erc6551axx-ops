// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
library Math { function sqrt(uint256 x) internal pure returns (uint256 y) { if (x==0) return 0; uint256 z=(x+1)/2; y=x; while(z<y){y=z; z=(x/z+z)/2;} } }
interface ISoulPoints { function contributions(address user) external view returns (uint256 points,uint256 lastUpdate,uint256 frequency); }
contract PluralityScore {
    ISoulPoints public soulPoints; constructor(address _soulPoints){ soulPoints=ISoulPoints(_soulPoints); }
    function pluralityScore(address[] calldata supporters,uint256 M,uint256 cost) external view returns(uint256){
        uint256 sumRoot=0; for(uint256 i=0;i<supporters.length;i++){ (uint256 p,,)=soulPoints.contributions(supporters[i]); sumRoot += Math.sqrt(p); }
        uint256 s2 = sumRoot * sumRoot; return (M * s2) / (cost==0?1:cost);
    }
}
