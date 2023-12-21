system"l tetris/utils.q";

.tetris.inputLogic:{[input]
  $[
    .tetris.gameEnded;.tetris.gameEndedInputLogic input;
    .tetris.gamePlayingInputLogic input
  ];
 };

.tetris.gameEndedInputLogic:{[input]
  $[
    input~"y";startScene[`tetris;()!()];
    input~"n";startScene[`menu;()!()];
    ()
  ];
 };

.tetris.gamePlayingInputLogic:{[input]
  if[`~.tetris.currentPiece`type;:()];

  $[
    input~"";:();
    input in "ad";.tetris.currentPiece:.tetris.tryMoveHorizontal[.tetris.currentPiece;input~"d"];
    input in "qe";.tetris.currentPiece:.tetris.tryRotate[.tetris.currentPiece;input~"e"];
    input~"s";$[not .tetris.canGoDown .tetris.currentPiece;
      [`.tetris.lastTickedTime set 0D;`.tetris.tickTimeExtraAllowance set 0D];
      .tetris.currentPiece:last .tetris.trySoftDrop .tetris.currentPiece
    ];
    input~"w";[
      .tetris.currentPiece:.tetris.hardDrop .tetris.currentPiece;
      `.tetris.lastTickedTime set 0D;
      `.tetris.tickTimeExtraAllowance set 0D
    ];
    input~" ";.tetris.tryHoldPiece[];
    ()
  ];
 };

.tetris.tryMoveHorizontal:{[piece;doMoveRight]
  testPiece:piece;
  testPiece[`x]+:$[doMoveRight;1;-1];

  if[.tetris.doesCollide[testPiece];:piece];

  piece[`x]:testPiece`x;

  $[
    not .tetris.canGoDown piece;`.tetris.tickTimeExtraAllowance set .z.p+0D00:00:01;
    if[not .tetris.tickTimeExtraAllowance~0D;`.tetris.tickTimeExtraAllowance set 0D]
  ];

  :piece;
 };

.tetris.tryRotate:{[piece;doRotateCW]
  if[`o~piece`type;:piece];

  testPiece:piece;
  testPiece[`rotation]+:$[doRotateCW;1;-1];
  testPiece[`rotation]:testPiece[`rotation] mod count PIECES piece`type;

  if[.tetris.doesCollide[testPiece];:piece];

  piece[`rotation]:testPiece`rotation;
  
  $[
    not .tetris.canGoDown piece;`.tetris.tickTimeExtraAllowance set .z.p+0D00:00:01;
    if[not .tetris.tickTimeExtraAllowance~0D;`.tetris.tickTimeExtraAllowance set 0D]
  ];

  :piece;
 };

.tetris.canGoDown:{[piece]
  testPiece:piece;
  testPiece[`y]+:1;

  :$[.tetris.doesCollide[testPiece];0b;1b];
 };

.tetris.trySoftDrop:{[piece]
  testPiece:piece;
  testPiece[`y]+:1;

  if[.tetris.doesCollide[testPiece];:(0b;piece)];

  piece[`y]:testPiece`y;

  :(1b;piece);
 };

.tetris.hardDrop:{[piece]
  res:(1b;piece);

  while[1b~first res;
    res:.tetris.trySoftDrop last res;
  ];

  :last res;
 };

.tetris.tryHoldPiece:{[]
  if[not .tetris.justHeldPiece;.tetris.holdCurrentPiece[]];
 };

.tetris.holdCurrentPiece:{[]
  prevHeldPiece:.tetris.heldPiece;
  .tetris.heldPiece:.tetris.currentPiece[`type];
  .tetris.getNextPiece prevHeldPiece;

  `.tetris.justHeldPiece set 1b;
 };
