.tetris.score:0;
.tetris.gameLevel:0;
.tetris.lines:0;

.tetris.initTickLogic:{[]
  `.tetris.score set 0;
  `.tetris.gameLevel set 0;
  `.tetris.lines set 0;
 };

.tetris.tickLogic:{[]
  if[.tetris.gameEnded;:()];

  canGoDown:.tetris.canGoDown .tetris.currentPiece;

  if[canGoDown and not DEBUG_NO_FALLING;
    .tetris.currentPiece[`y]+:1;
  ];

  if[not canGoDown;
    minY:.tetris.addPieceToGrid .tetris.currentPiece;
    numLinesCleared:.tetris.handleLineClears[];

    $[
      0>=minY+numLinesCleared;.tetris.triggerGameOver[];
      .tetris.getNextPiece`
    ];

    .Q.gc[];

    :();
  ];

  `.gameLoop.drawNextFrame set 1b;
  `.tetris.lastTickedTime set .z.p;
 };

.tetris.triggerGameOver:{[]
  `.tetris.gameEnded set 1b;
  .tetris.currentPiece[`type]:`;
 };

.tetris.addPieceToGrid:{[piece]
  coords:.tetris.utils.getRelCoords[piece`type;piece`rotation];
  coords[`x]+:piece`x;
  coords[`y]+:piece`y;

  minY:min coords[`y];

  isWithinRange:(coords[`x] within (0;BOARD_WIDTH-1))and coords[`y] within (0;BOARD_HEIGHT-1);
  coords[`x]:coords[`x] where isWithinRange;
  coords[`y]:coords[`y] where isWithinRange;

  indices:coords[`x]+BOARD_WIDTH*coords`y;

  flatGrid:raze .tetris.gameGrid;
  flatGrid[indices]:1b;

  `.tetris.gameGrid set BOARD_WIDTH cut flatGrid;
  `.tetris.justHeldPiece set 0b;

  :minY;
 };

.tetris.handleLineClears:{[]
  gameGrid:.tetris.gameGrid;

  linesNotCleared:not all each gameGrid;
  if[all linesNotCleared;:0];

  gameGrid:gameGrid where linesNotCleared;
  gameGrid:(-1*BOARD_HEIGHT)#(BOARD_HEIGHT#(enlist BOARD_WIDTH#0b)),gameGrid;

  `.tetris.gameGrid set gameGrid;

  `.tetris.score set .tetris.score + (.tetris.gameLevel+1)*LINE_CLEAR_SCORES[-1+count where not linesNotCleared];
  `.tetris.lines set .tetris.lines+`long$sum not linesNotCleared;
  `.tetris.gameLevel set floor .tetris.lines % 10;

  .tetris.utils.updateTickTime[];

  :count where not linesNotCleared;
 };
