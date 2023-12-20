system"l tetris/constants.q";

.tetris.utils.stretchAndFlattenCoords:{[coords]
  coords:.tetris.utils.stretchCoords coords;

  :coords[`x] + BOARD_VISUAL_WIDTH*coords`y;
 };

.tetris.utils.stretchCoords:{[wFactor;hFactor;x]
  x[`x]:.tetris.utils.stretchPoints[x`x;wFactor;hFactor];
  x[`y]:.tetris.utils.stretchPoints[x`y;hFactor;wFactor];
  :x;
 }[BOARD_VISUAL_WIDTH_FACTOR;BOARD_VISUAL_HEIGHT_FACTOR];

.tetris.utils.stretchPoints:{[x;dimFactor;otherDimFactor]
  :raze+[dimFactor*x]each(dimFactor*otherDimFactor)#til dimFactor;
 };

.tetris.doesCollide:{[piece]
  relCoords:.tetris.utils.getRelCoords[piece`type;piece`rotation];

  :any{[x;y]
    if[(y>=count .tetris.gameGrid)or x>=count first .tetris.gameGrid;:1b];
    if[(y<0)or x<0;:1b];

    :.tetris.gameGrid[y;x];
  }'[piece[`x]+relCoords`x;piece[`y]+relCoords`y];
 };

.tetris.utils.getRelCoords:{[pieceType;rotation]
  :PIECES[pieceType;rotation];
 };

.tetris.utils.updateTickTime:{[]
  `.tetris.tickTime set TICK_TIMES min[.tetris.gameLevel;29];
 };
