system"l tetris/constants.q";
system"l tetris/utils.q";
system"l tetris/inputLogic.q";
system"l tetris/tickLogic.q";
system"l tetris/draw.q";


.tetris.tickTime:TICK_TIMES 0;
.tetris.tickTimeExtraAllowance:0D;
.tetris.lastTickedTime:.z.p;

.tetris.score:0;
.tetris.gameLevel:0;
.tetris.lines:0;

.tetris.pieceQueue:`$();
.tetris.heldPiece:`;
.tetris.justHeldPiece:0b;

.tetris.visualBoard1D:"";
.tetris.visualBoardIndices:();
.tetris.gameGrid:BOARD_HEIGHT#(enlist BOARD_WIDTH#0b);
.tetris.currentPiece:`x`y`type`rotation!(0;0;`;0);
.tetris.showGuidePiece:1b;

.tetris.gameEnded:0b;
.tetris.gamePaused:0b;
.tetris.pauseCacheTsDiff:0D;

.tetris.allowWallKicks:1b;
.tetris.allowFloorKicks:1b;

.tetris.start:{[args]
  `.tetris.score set 0;
  `.tetris.gameLevel set 0;
  `.tetris.lines set 0;

  `.tetris.tickTimeExtraAllowance set 0D;
  `.tetris.lastTickedTime set .z.p;
  .tetris.utils.updateTickTime[];

  `.tetris.pieceQueue set 4?key PIECES;
  `.tetris.heldPiece set `;
  `.tetris.justHeldPiece set 0b;
  .tetris.getNextPiece`;

  `.tetris.gameEnded set 0b;
  `.tetris.gamePaused set 0b;
  `.tetris.pauseCacheTsDiff set 0D;

  .tetris.loadVisualBoard1D[];

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
  if[.tetris.gameEnded;lvl:.tetris.drawGameOver lvl];
  if[.tetris.gamePaused and not .tetris.gameEnded;lvl:.tetris.drawPaused lvl];

  -1 lvl;
 };

.tetris.getNextPiece:{[nextPiece]
  if[nextPiece~`;
    nextPiece:first .tetris.pieceQueue;
    .tetris.pieceQueue:1 _ .tetris.pieceQueue;
    .tetris.pieceQueue,:1?key PIECES;
  ];

  .tetris.currentPiece[`x]:PIECE_START`x;
  .tetris.currentPiece[`y]:PIECE_START`y;
  .tetris.currentPiece[`type]:nextPiece;
  .tetris.currentPiece[`rotation]:0;

  while[.tetris.utils.doesCollide .tetris.currentPiece;
    .tetris.currentPiece[`y]-:1;
  ];

  `.tetris.justHeldPiece set 0b;

  `.tetris.lastTickedTime set .z.p;
 };

.tetris.loadVisualBoard1D:{[]
  `.tetris.visualBoardIndices set ();

  `.tetris.visualBoard1D set raze{[x;y]
    res:ssr[ssr[.tetris.level[indices:x+til 1+y-x];"@";" "];"&";" "];

    `.tetris.visualBoardIndices set .tetris.visualBoardIndices,indices;

    :res;
  }'[ss[.tetris.level;"@"];ss[.tetris.level;"&"]];
 };
