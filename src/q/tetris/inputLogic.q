system"l tetris/utils.q";


.tetris.allowWallKicks:1b;
.tetris.allowFloorKicks:1b;

.tetris.initInputLogic:{[]
  `.tetris.allowWallKicks set 1b;
  `.tetris.allowFloorKicks set 1b;
 };

.tetris.inputLogic:{[input]
  $[
    .tetris.gameEnded;.tetris.gameEndedInputLogic input;
    .tetris.gamePaused;.tetris.gamePausedInputLogic input;
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

.tetris.gamePausedInputLogic:{[input]
  $[
    input~"p";.tetris.togglePaused[];
    ()
  ];
 };

.tetris.gamePlayingInputLogic:{[input]
  if[`~.tetris.currentPiece`type;:()];

  $[
    input~"";:();
    input~"p";.tetris.togglePaused[];
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

.tetris.togglePaused:{[]
  `.tetris.gamePaused set not .tetris.gamePaused;

  $[
    .tetris.gamePaused;`.tetris.pauseCacheTsDiff set .z.p - .tetris.lastTickedTime;
    `.tetris.lastTickedTime set .z.p - .tetris.pauseCacheTsDiff
  ];
 };

.tetris.tryMoveHorizontal:{[piece;doMoveRight]
  testPiece:piece;
  testPiece[`x]+:$[doMoveRight;1;-1];

  if[.tetris.utils.doesCollide testPiece;:piece];

  piece[`x]:testPiece`x;

  $[
    not .tetris.canGoDown piece;`.tetris.tickTimeExtraAllowance set .z.p+TICK_TIME_ALLOWANCE;
    if[not .tetris.tickTimeExtraAllowance~0D;`.tetris.tickTimeExtraAllowance set 0D]
  ];

  :piece;
 };

.tetris.tryRotate:{[piece;doRotateCW]
  if[`o~piece`type;:piece];

  testPiece:piece;
  testPiece[`rotation]+:$[doRotateCW;1;-1];
  testPiece[`rotation]:testPiece[`rotation] mod count PIECES piece`type;

  if[.tetris.utils.doesCollide testPiece;
    piece:.tetris.tryRotationKick[testPiece;piece];
    :piece;
  ];

  piece[`rotation]:testPiece`rotation;
  
  $[
    not .tetris.canGoDown piece;`.tetris.tickTimeExtraAllowance set .z.p+TICK_TIME_ALLOWANCE;
    if[not .tetris.tickTimeExtraAllowance~0D;`.tetris.tickTimeExtraAllowance set 0D]
  ];

  :piece;
 };

.tetris.tryRotationKick:{[testPiece;piece]
  initialX:testPiece`x;
  initialY:testPiece`y;

  if[.tetris.allowFloorKicks;
    yList:testPiece[`y]+$[`i~piece`type;-1 -2;raze -1];

    res:{[testPiece;y]
      testPiece[`y]:y;
      :not .tetris.utils.doesCollide testPiece;
    }[testPiece]each yList;

    if[any res;
      testPiece[`y]:first yList where res;

      $[
        not .tetris.canGoDown testPiece;`.tetris.tickTimeExtraAllowance set .z.p+TICK_TIME_ALLOWANCE;
        if[not .tetris.tickTimeExtraAllowance~0D;`.tetris.tickTimeExtraAllowance set 0D]
      ];

      :testPiece;
    ];
  ];

  if[.tetris.allowWallKicks;
    xList:testPiece[`x]+$[`i~piece`type;1 -1 2;1 -1];
    xList:xList where xList within (0;BOARD_WIDTH-1);

    res:{[testPiece;x]
      testPiece[`x]:x;
      :not .tetris.utils.doesCollide testPiece;
    }[testPiece]each xList;

    if[any res;
      testPiece[`x]:first xList where res;

      $[
        not .tetris.canGoDown testPiece;`.tetris.tickTimeExtraAllowance set .z.p+TICK_TIME_ALLOWANCE;
        if[not .tetris.tickTimeExtraAllowance~0D;`.tetris.tickTimeExtraAllowance set 0D]
      ];

      :testPiece;
    ];
  ];

  :piece;
 };

.tetris.canGoDown:{[piece]
  testPiece:piece;
  testPiece[`y]+:1;

  :$[.tetris.utils.doesCollide[testPiece];0b;1b];
 };

.tetris.trySoftDrop:{[piece]
  testPiece:piece;
  testPiece[`y]+:1;

  if[.tetris.utils.doesCollide[testPiece];:(0b;piece)];

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
