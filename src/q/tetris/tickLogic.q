.tetris.tickLogic:{[]
  canGoDown:.tetris.canGoDown .tetris.currentPiece;

  if[canGoDown;
    .tetris.currentPiece[`y]+:1;
  ];

  if[not canGoDown;
    .tetris.addPieceToGrid .tetris.currentPiece;
    .tetris.handleLineClears[];
    .tetris.getNextPiece`;

    .Q.gc[];

    :();
  ];

  `.gameLoop.drawNextFrame set 1b;
  `.tetris.lastTickedTime set .z.p;
 };

.tetris.letGoOfPiece:{[]
  .tetris.currentPiece[`type]:`;
 };

.tetris.addPieceToGrid:{[piece]
  coords:.tetris.utils.getRelCoords[piece`type;piece`rotation];
  coords[`x]+:piece`x;
  coords[`y]+:piece`y;

  indices:coords[`x]+BOARD_WIDTH*coords`y;

  flatGrid:raze .tetris.gameGrid;
  flatGrid[indices]:1b;

  `.tetris.gameGrid set BOARD_WIDTH cut flatGrid;
  `.tetris.justHeldPiece set 0b;
 };

.tetris.handleLineClears:{[]
  gameGrid:.tetris.gameGrid;

  linesNotCleared:not all each gameGrid;
  if[all linesNotCleared;:()];

  gameGrid:gameGrid where linesNotCleared;
  gameGrid:(-1*BOARD_HEIGHT)#(BOARD_HEIGHT#(enlist BOARD_WIDTH#0b)),gameGrid;

  `.tetris.gameGrid set gameGrid;

  `.tetris.score set .tetris.score + .tetris.gameLevel*LINE_CLEAR_SCORES[-1+count where not linesNotCleared];

  `.tetris.lines set .tetris.lines+`long$sum not linesNotCleared;
  `.tetris.gameLevel set 1+floor .tetris.lines % 10;

  .tetris.utils.updateTickTime[];
 };
