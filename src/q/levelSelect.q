system"l levelSelect/inputLogic.q";
system"l levelSelect/draw.q";

DEFAULT_GAME_LEVEL:0;
DEFAULT_RANDOMISER:`modern;
DEFAULT_NUM_SHOWN_IN_QUEUE:4;
DEFAULT_CAN_HOLD_PIECES:1b;
DEFAULT_SHOW_GUIDE:1b;
DEFAULT_ALLOW_WALL_KICKS:1b;
DEFAULT_ALLOW_FLOOR_KICKS:1b;

.levelSelect.gameLevel:DEFAULT_GAME_LEVEL;
.levelSelect.randomiserMode:DEFAULT_RANDOMISER;
.levelSelect.numShownInQueue:DEFAULT_NUM_SHOWN_IN_QUEUE;
.levelSelect.canHoldPieces:DEFAULT_CAN_HOLD_PIECES;
.levelSelect.showGuidePiece:DEFAULT_SHOW_GUIDE;
.levelSelect.allowWallKicks:DEFAULT_ALLOW_WALL_KICKS;
.levelSelect.allowFloorKicks:DEFAULT_ALLOW_FLOOR_KICKS;

.levelSelect.start:{[args]
  .levelSelect.initInputLogic[args];

  draw[];
 };

.levelSelect.process:{[input]
  .levelSelect.inputLogic input;
 };

.levelSelect.draw:{[]
  
 };
