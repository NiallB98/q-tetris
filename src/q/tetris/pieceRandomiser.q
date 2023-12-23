.tetris.currentPiece:`x`y`type`rotation!(0;0;`;0);
.tetris.pieceQueue:`$();

.tetris.randomiserMode:`modern;  // Possible modes: `fullyRandom, `nes, `modern
.tetris.randomiser.currentBag:-7?key PIECES;  // Used by `modern

.tetris.initPieceRandomiser:{[args]
  `.tetris.randomiserMode set args`randomiserMode;
  `.tetris.randomiser.currentBag set `$();
  `.tetris.pieceQueue set `$();

  {.tetris.addToQueue[]}each til 4;
  .tetris.getNextPiece`;
 };

.tetris.getNextPiece:{[nextPiece]
  if[nextPiece~`;
    nextPiece:first .tetris.pieceQueue;
    `.tetris.pieceQueue set 1 _ .tetris.pieceQueue;
    .tetris.addToQueue[];
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

.tetris.addToQueue:{[]
  $[
    .tetris.randomiserMode~`fullyRandom;.tetris.randomiser.fullyRandom.addToQueue[];
    .tetris.randomiserMode~`modern;.tetris.randomiser.modern.addToQueue[];
    .tetris.randomiserMode~`nes;.tetris.randomiser.nes.addToQueue[];
    'randomiserModeNotFound
  ];
 };

.tetris.randomiser.fullyRandom.addToQueue:{[]
  `.tetris.pieceQueue set .tetris.pieceQueue,1?key PIECES;
 };

.tetris.randomiser.modern.addToQueue:{[]
  if[0~count .tetris.randomiser.currentBag;`.tetris.randomiser.currentBag set -7?key PIECES];

  `.tetris.pieceQueue set .tetris.pieceQueue, first .tetris.randomiser.currentBag;
  `.tetris.randomiser.currentBag set 1 _ .tetris.randomiser.currentBag;
 };

.tetris.randomiser.nes.addToQueue:{[]
  newPiece:first 1?key[PIECES],`reroll;
  if[newPiece~`reroll;newPiece:first 1?key PIECES];

  `.tetris.pieceQueue set .tetris.pieceQueue,newPiece;
 };
