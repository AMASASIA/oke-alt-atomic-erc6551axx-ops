import React from 'react';
export const SoulPointsCard: React.FC<{ points?: number }> = ({ points = 0 }) => (
  <div style={{background:"linear-gradient(145deg,#0a0a0a,#111)",border:"1px solid #1f1f1f",borderRadius:16,padding:18,color:"#e6e6e6"}}>
    <div style={{ fontSize: 14, color: "#8fb1ff" }}>SOUL POINTS</div>
    <div style={{ fontSize: 28, marginTop: 6 }}>{points} <span style={{ color: "#8fb1ff" }}>+</span></div>
  </div>
);