system"l tetris/constants.q";
system"l tetris/utils.q";
system"l tetris/pieceRandomiser.q";
system"l tetris/inputLogic.q";
system"l tetris/tickLogic.q";
system"l tetris/draw.q";


.tetris.tickTime:TICK_TIMES 0;
.tetris.tickTimeExtraAllowance:0D;
.tetris.lastTickedTime:.z.p;

.tetris.heldPiece:`;
.tetris.justHeldPiece:0b;

.tetris.gameGrid:BOARD_HEIGHT#(enlist BOARD_WIDTH#0b);

.tetris.gameEnded:0b;
.tetris.gamePaused:0b;
.tetris.pauseCacheTsDiff:0D;

.tetris.start:{[args]
  .tetris.initInputLogic[args];
  .tetris.initTickLogic[args];
  .tetris.initPieceRandomiser[args];
  .tetris.initDraw[args];

  `.tetris.tickTimeExtraAllowance set 0D;
  `.tetris.lastTickedTime set .z.p;
  .tetris.utils.updateTickTime[];

  `.tetris.heldPiece set `;
  `.tetris.justHeldPiece set 0b;

  `.tetris.gameEnded set 0b;
  `.tetris.gamePaused set 0b;
  `.tetris.pauseCacheTsDiff set 0D;

  `.tetris.gameGrid set BOARD_HEIGHT#(enlist BOARD_WIDTH#0b);

  draw[];
 };

.tetris.process:{[input]
  .tetris.inputLogic input;

  if[.tetris.gamePaused;:()];
  
  if[(.z.p>=.tetris.tickTime+.tetris.lastTickedTime) and .z.p>= .tetris.tickTimeExtraAllowance;
    .tetris.tickLogic[];
  ];
 };

.tetris.draw:{[]
  lvl:.tetris.level;

  lvl:.tetris.drawScore[lvl;.tetris.score];
  lvl:.tetris.drawNextPieces[lvl;.tetris.pieceQueue];
  lvl:.tetris.drawHeldPiece[lvl;.tetris.heldPiece;.tetris.justHeldPiece];
  lvl:.tetris.drawGameLevel[lvl;.tetris.gameLevel];
  lvl:.tetris.drawLines[lvl;.tetris.lines];
  lvl:.tetris.drawVisualBoard[lvl;.tetris.visualBoard1D;.tetris.currentPiece;.tetris.gameGrid];
  lvl:.tetris.drawOverflowIndicator[lvl;.tetris.currentPiece];

  if[.tetris.gameEnded;lvl:.tetris.drawGameOver lvl];
  if[.tetris.gamePaused and not .tetris.gameEnded;lvl:.tetris.drawPaused lvl];

  lvl:.common.centreLvl lvl;

  -1 lvl;
 };
