 LEVEL_SELECT_OPTIONS:`level`randomiser`queueLength`canHoldPieces`showGuide`allowWallKicks`allowFloorKicks`play;
 
 .levelSelect.cursorPosY:0;
 
 .levelSelect.initInputLogic:{[args]
  `.levelSelect.cursorPosY set 0; 
 };

.levelSelect.inputLogic:{[input]
  $[
    input~"r";.levelSelect.resetToDefaults[];
    input~"w";`.levelSelect.cursorPosY set (.levelSelect.cursorPosY-1) mod count LEVEL_SELECT_OPTIONS;
    input~"s";`.levelSelect.cursorPosY set (.levelSelect.cursorPosY+1) mod count LEVEL_SELECT_OPTIONS;
    ()
  ];
 };

.levelSelect.resetToDefaults:{[]
  `.levelSelect.gameLevel set DEFAULT_GAME_LEVEL;
  `.levelSelect.randomiserMode set DEFAULT_RANDOMISER;
  `.levelSelect.numShownInQueue set DEFAULT_NUM_SHOWN_IN_QUEUE;
  `.levelSelect.canHoldPieces set DEFAULT_CAN_HOLD_PIECES;
  `.levelSelect.showGuidePiece set DEFAULT_SHOW_GUIDE;
  `.levelSelect.allowWallKicks set DEFAULT_ALLOW_WALL_KICKS;
  `.levelSelect.allowFloorKicks set DEFAULT_ALLOW_FLOOR_KICKS;
 };
