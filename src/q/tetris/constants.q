TICK_TIMES:(
  0D00:00:01.00000;  // Level 0
  0D00:00:00.90000;  // Level 1
  0D00:00:00.80000;  // Level 2
  0D00:00:00.71666;  // Level 3
  0D00:00:00.63333;  // Level 4
  0D00:00:00.55000;  // Level 5
  0D00:00:00.46666;  // Level 6
  0D00:00:00.38333;  // Level 7
  0D00:00:00.30000;  // Level 8
  0D00:00:00.21666;  // Level 9
  0D00:00:00.13333;  // Level 10
  0D00:00:00.13333;  // Level 11
  0D00:00:00.13333;  // Level 12
  0D00:00:00.10000;  // Level 13
  0D00:00:00.10000;  // Level 14
  0D00:00:00.10000;  // Level 15
  0D00:00:00.08333;  // Level 16
  0D00:00:00.08333;  // Level 17
  0D00:00:00.08333;  // Level 18
  0D00:00:00.06666;  // Level 19
  0D00:00:00.06666;  // Level 20
  0D00:00:00.06666;  // Level 21
  0D00:00:00.06666;  // Level 22
  0D00:00:00.06666;  // Level 23
  0D00:00:00.06666;  // Level 24
  0D00:00:00.06666;  // Level 25
  0D00:00:00.06666;  // Level 26
  0D00:00:00.06666;  // Level 27
  0D00:00:00.06666;  // Level 28
  0D00:00:00.05000   // Level 29+
 );

TICK_TIME_ALLOWANCE:0D00:00:00.8;

PIECE_START:`x`y!4 1;

BOARD_WIDTH:10;
BOARD_HEIGHT:20;

BOARD_VISUAL_WIDTH_FACTOR:2;
BOARD_VISUAL_HEIGHT_FACTOR:1;

BOARD_VISUAL_WIDTH:BOARD_WIDTH*BOARD_VISUAL_WIDTH_FACTOR;
BOARD_VISUAL_HEIGHT:BOARD_HEIGHT*BOARD_VISUAL_HEIGHT_FACTOR;

LINE_CLEAR_SCORES:40 100 300 1200;

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
