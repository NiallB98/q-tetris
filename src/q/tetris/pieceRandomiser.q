.tetris.currentPiece:`x`y`type`rotation!(0;0;`;0);
.tetris.pieceQueue:`$();

.tetris.initPieceRandomiser:{[]
  `.tetris.pieceQueue set 4?key PIECES;

  .tetris.getNextPiece`;
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
