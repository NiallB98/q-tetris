.tetris.lineClearAnimation:{[args]
  if[animationFramesLeft~1;draw[];:()];

  lvl:.tetris.level;

  lvl:.tetris.drawScore[lvl;.tetris.score];
  lvl:.tetris.drawNextPieces[lvl;args`pieceQueue];
  lvl:.tetris.drawGameLevel[lvl;.tetris.gameLevel];
  lvl:.tetris.drawLines[lvl;.tetris.lines];
  lvl:.tetris.drawVisualBoard[lvl;.tetris.visualBoard1D;enlist[`type]!enlist`;args`gameGrid];

  lvl:ssr[lvl;(10*6)#"[[][]]";20#$[animationFramesLeft mod 2;"#";" "]];

  lvl:.common.centreLvl lvl;

  .common.cls[];
  -1 lvl;
 };
