system"l tetris/utils.q";


.tetris.showGuidePiece:1b;

.tetris.visualBoard1D:"";
.tetris.visualBoardIndices:();

.tetris.initDraw:{[]
  `.tetris.showGuidePiece set 1b;

  .tetris.loadVisualBoard1D[];
 };

.tetris.loadVisualBoard1D:{[]
  `.tetris.visualBoardIndices set ();

  `.tetris.visualBoard1D set raze{[x;y]
    res:ssr[ssr[.tetris.level[indices:x+til 1+y-x];"@";" "];"&";" "];

    `.tetris.visualBoardIndices set .tetris.visualBoardIndices,indices;

    :res;
  }'[ss[.tetris.level;"@"];ss[.tetris.level;"&"]];
 };

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

  isWithinRange:(coords[`x] within (0;BOARD_WIDTH-1))and coords[`y] within (0;BOARD_HEIGHT-1);
  coords[`x]:coords[`x] where isWithinRange;
  coords[`y]:coords[`y] where isWithinRange;

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

.tetris.drawGameOver:{[lvl]
  splitLvl:"\n" vs lvl;

  lvlWidth:count first splitLvl;

  midY:floor count[splitLvl]%2;
  midX:floor lvlWidth%2;

  line1:"/------------------------------\\";
  line2:"|          GAME OVER           |";
  line3:"|  Would you like to restart?  |";
  line4:"|            [Y/N]             |";
  line5:"\\------------------------------/";

  lineStartX:midX-floor count[line1]%2;
  lineEndX:-1+midX+ceiling count[line1]%2;

  x:1+lineStartX+til 1+lineEndX-lineStartX;

  splitLvl[midY-2;x]:line1;
  splitLvl[midY-1;x]:line2;
  splitLvl[midY+0;x]:line3;
  splitLvl[midY+1;x]:line4;
  splitLvl[midY+2;x]:line5;

  lvl:"\n" sv splitLvl;

  :lvl;
 };

.tetris.drawPaused:{[lvl]
  splitLvl:"\n" vs lvl;

  lvlWidth:count first splitLvl;

  midY:floor count[splitLvl]%2;
  midX:floor lvlWidth%2;

  line1:"/------------------------------\\";
  line2:"|         GAME PAUSED          |";
  line3:"|                              |";
  line4:"|     Press [P] to Unpause     |";
  line5:"\\------------------------------/";

  lineStartX:midX-floor count[line1]%2;
  lineEndX:-1+midX+ceiling count[line1]%2;

  x:1+lineStartX+til 1+lineEndX-lineStartX;

  splitLvl[midY-2;x]:line1;
  splitLvl[midY-1;x]:line2;
  splitLvl[midY+0;x]:line3;
  splitLvl[midY+1;x]:line4;
  splitLvl[midY+2;x]:line5;

  lvl:"\n" sv splitLvl;

  :lvl;
 };

.tetris.drawOverflowIndicator:{[lvl;currentPiece]
  coords:.tetris.utils.getRelCoords[currentPiece`type;currentPiece`rotation];
  coords[`x]+:currentPiece`x;
  coords[`y]+:currentPiece`y;

  xList:coords[`x] where 0>coords`y;

  if[0~count xList;:lvl];

  tgtIndices:{(x*2),1+x*2}each xList;
  s:"====================";

  s[tgtIndices]:"#";
  
  startIndex:1+first ss[lvl;"/====================\\"];
  lvlIndices:startIndex+til count s;

  lvl[lvlIndices]:s;

  :lvl;
 };
