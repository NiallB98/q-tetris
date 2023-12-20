system"l tetris/utils.q";

.tetris.drawScore:{[lvl;score]
  :ssr[lvl;"SSSSSSSS";-8#"00000000",string score&99999999];
 };

.tetris.drawNextPieces:{[lvl;pieceQueue]
  lvl:.tetris.drawPieceOnUI[lvl;pieceQueue 0;0b;"AAAAAAAA"];
  lvl:.tetris.drawPieceOnUI[lvl;pieceQueue 1;0b;"XXXXXXXX"];
  lvl:.tetris.drawPieceOnUI[lvl;pieceQueue 2;0b;"YYYYYYYY"];
  lvl:.tetris.drawPieceOnUI[lvl;pieceQueue 3;0b;"ZZZZZZZZ"];

  :lvl;
 };

.tetris.drawHeldPiece:{[lvl;heldPiece;justHeldPiece]
  :.tetris.drawPieceOnUI[lvl;heldPiece;justHeldPiece;"HHHHHHHH"];
 };

.tetris.drawGameLevel:{[lvl;gameLevel]
  :ssr[lvl;"$$";-2#"00",string gameLevel&99];
 };

.tetris.drawLines:{[lvl;lines]
  :ssr[lvl;"£££";-3#"000",string lines&999];
 };

.tetris.drawVisualBoard:{[lvl;visualBoard1D;currentPiece;gameGrid]
  if[currentPiece[`type]<>`;
    if[.tetris.showGuidePiece;
      visualBoard1D:.tetris.drawGuidePieceOnBoard[visualBoard1D;currentPiece];
    ];

    visualBoard1D:.tetris.drawCurrentPieceOnBoard[visualBoard1D;currentPiece];
  ];

  visualBoard1D:.tetris.drawGameGridOnBoard[visualBoard1D;gameGrid];

  lvl[.tetris.visualBoardIndices-3]:visualBoard1D;  // TODO: Work out why -3 is needed

  :lvl;
 };

.tetris.drawGameGridOnBoard:{[visualBoard1D;gameGrid]
  indices:where raze gameGrid;
  x:indices mod BOARD_WIDTH;
  y:floor indices%BOARD_WIDTH;

  visualIndices:asc .tetris.utils.stretchAndFlattenCoords `x`y!(x;y);
  visualBoard1D[visualIndices]:count[visualIndices]#"[]";

  :visualBoard1D;
 };

.tetris.drawCurrentPieceOnBoard:{[visualBoard1D;currentPiece]
  :.tetris.drawPieceOnBoard[visualBoard1D;currentPiece;"[]"];
 };

.tetris.drawGuidePieceOnBoard:{[visualBoard1D;currentPiece]
  :.tetris.drawPieceOnBoard[visualBoard1D;.tetris.hardDrop currentPiece;"()"];
 };

.tetris.drawPieceOnBoard:{[visualBoard1D;piece;blockString]
  coords:.tetris.utils.getRelCoords[piece`type;piece`rotation];
  coords[`x]+:piece`x;
  coords[`y]+:piece`y;

  visualIndices:asc .tetris.utils.stretchAndFlattenCoords coords;
  visualBoard1D[visualIndices]:count[visualIndices]#blockString;

  :visualBoard1D;
 };

.tetris.drawPieceOnUI:{[lvl;pieceType;useAltStyle;searchStr]
  if[pieceType~`;
    pieceVisual:(2#enlist 8#" ");
  ];

  if[pieceType<>`;
    pieceVisual:UI_PIECE_VISUAL pieceType;
    if[useAltStyle;pieceVisual:{ssr[ssr[x;"[[]";"("];"[]]";")"]}each pieceVisual];
  ];

  startIndices:ss[lvl;searchStr];
  lvl[first[startIndices]+til count searchStr]:first pieceVisual;
  lvl[last[startIndices]+til count searchStr]:last pieceVisual;

  :lvl;
 };
