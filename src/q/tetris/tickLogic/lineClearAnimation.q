.tetris.lineClearAnimation:{[args]
  if[animationFramesLeft~1;draw[];:()];
  if[animationFramesLeft<>args`framesCount;:()];

  .common.cls[];

  lvl:.tetris.level;

  lvl:.tetris.drawScore[lvl;.tetris.score];
  lvl:.tetris.drawNextPieces[lvl;args`pieceQueue];
  lvl:.tetris.drawGameLevel[lvl;.tetris.gameLevel];
  lvl:.tetris.drawLines[lvl;.tetris.lines];
  lvl:.tetris.drawVisualBoard[lvl;.tetris.visualBoard1D;enlist[`type]!enlist`;args`gameGrid];

  lvl:ssr[lvl;(10*6)#"[[][]]";20#"X"];

  lvl:.common.centreLvl lvl;

  -1 lvl;
 };
