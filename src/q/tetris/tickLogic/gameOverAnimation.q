.tetris.gameOverAnimation:{[args]
  clearIndices:where any each .tetris.gameGrid;
  if[(animationFramesLeft<=count .tetris.gameGrid)and 0<count clearIndices;
    .tetris.gameGrid[first clearIndices]:BOARD_WIDTH#0b;
  ];

  lvl:.tetris.level;

  lvl:.tetris.drawScore[lvl;.tetris.score];
  lvl:.tetris.drawNextPieces[lvl;.tetris.pieceQueue];
  lvl:.tetris.drawHeldPiece[lvl;.tetris.heldPiece;.tetris.justHeldPiece];
  lvl:.tetris.drawGameLevel[lvl;.tetris.gameLevel];
  lvl:.tetris.drawLines[lvl;.tetris.lines];
  lvl:.tetris.drawVisualBoard[lvl;.tetris.visualBoard1D;.tetris.currentPiece;.tetris.gameGrid];
  lvl:.tetris.drawOverflowIndicator[lvl;.tetris.currentPiece];

  lvl:.common.centreLvl lvl;

  -1 lvl;
 };
