TICK_TIME_START:0D00:00:03;

PIECE_START:`x`y!4 1;

BOARD_WIDTH:10;
BOARD_HEIGHT:20;

BOARD_VISUAL_WIDTH_FACTOR:2;
BOARD_VISUAL_HEIGHT_FACTOR:1;

BOARD_VISUAL_WIDTH:BOARD_WIDTH*BOARD_VISUAL_WIDTH_FACTOR;
BOARD_VISUAL_HEIGHT:BOARD_HEIGHT*BOARD_VISUAL_HEIGHT_FACTOR;

LINE_CLEAR_SCORES:100 300 500 800;

PIECES:()!();

PIECES[`i]:(
  `x`y!flip((-1 0);(0 0);(1 0);(2 0));
  `x`y!flip((1 -1);(1 -2);(1 0);(1 1))
 );
PIECES[`j]:(
  `x`y!flip((0 0);(-1 0);(-1 -1);(1 0));
  `x`y!flip((0 0);(0 -1);(0 1);(1 -1));
  `x`y!flip((0 0);(-1 0);(1 1);(1 0));
  `x`y!flip((0 0);(0 -1);(0 1);(-1 1))
 );
PIECES[`l]:(
  `x`y!flip((0 0);(1 0);(-1 0);(1 -1));
  `x`y!flip((0 0);(0 -1);(0 1);(1 1));
  `x`y!flip((0 0);(1 0);(-1 0);(-1 1));
  `x`y!flip((0 0);(0 -1);(0 1);(-1 -1))
 );
PIECES[`o]:enlist[`x`y!flip((0 0);(0 1);(1 0);(1 1))];
PIECES[`s]:(
  `x`y!flip((0 0);(1 0);(-1 1);(0 1));
  `x`y!flip((0 0);(0 -1);(1 0);(1 1))
 );
PIECES[`z]:(
  `x`y!flip((0 0);(-1 0);(1 1);(0 1));
  `x`y!flip((0 0);(1 0);(1 -1);(0 1))
 );
PIECES[`t]:(
  `x`y!flip((0 0);(0 -1);(-1 0);(1 0));
  `x`y!flip((0 0);(0 -1);(0 1);(1 0));
  `x`y!flip((0 0);(0 1);(-1 0);(1 0));
  `x`y!flip((0 0);(0 -1);(0 1);(-1 0))
 );

UI_PIECE_VISUAL:()!();

UI_PIECE_VISUAL[`i]:(
    "[][][][]";
    "        "
 );
UI_PIECE_VISUAL[`j]:(
    " []     ";
    " [][][] "
 );
UI_PIECE_VISUAL[`l]:(
    "     [] ";
    " [][][] "
 );
UI_PIECE_VISUAL[`o]:(
    "  [][]  ";
    "  [][]  "
 );
UI_PIECE_VISUAL[`s]:(
    "   [][] ";
    " [][]   "
 );
UI_PIECE_VISUAL[`z]:(
    " [][]   ";
    "   [][] "
 );
UI_PIECE_VISUAL[`t]:(
    "   []   ";
    " [][][] "
 );
