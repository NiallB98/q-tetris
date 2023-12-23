system"l levelSelect/constants.q";
system"l levelSelect/inputLogic.q";
system"l levelSelect/draw.q";

.levelSelect.args:enlist[`]!enlist();
.levelSelect.args[`gameLevel]:DEFAULT_GAME_LEVEL;
.levelSelect.args[`randomiserMode]:DEFAULT_RANDOMISER;
.levelSelect.args[`numShownInQueue]:DEFAULT_NUM_SHOWN_IN_QUEUE;
.levelSelect.args[`canHoldPieces]:DEFAULT_CAN_HOLD_PIECES;
.levelSelect.args[`showGuidePiece]:DEFAULT_SHOW_GUIDE;
.levelSelect.args[`allowWallKicks]:DEFAULT_ALLOW_WALL_KICKS;
.levelSelect.args[`allowFloorKicks]:DEFAULT_ALLOW_FLOOR_KICKS;

 .levelSelect.currentSelection:0;

.levelSelect.start:{[args]
  `.levelSelect.currentSelection set 0;

  draw[];
 };

.levelSelect.process:{[input]
  .levelSelect.inputLogic input;
 };

.levelSelect.draw:{[]
  lvl:.levelSelect.level;

  lvl:.levelSelect.drawPrompt lvl;
  lvl:.levelSelect.drawCursor lvl;
  lvl:.levelSelect.drawSelectedOptions lvl;

  lvl:.common.centreLvl lvl;

  -1 lvl;
 };
