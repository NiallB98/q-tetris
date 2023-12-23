.levelSelect.inputLogic:{[input]
  if[input~"";:()];

  $[
    input~"r";.levelSelect.resetToDefaults[];
    input~"w";`.levelSelect.currentSelection set (.levelSelect.currentSelection-1) mod count LEVEL_SELECT_OPTIONS;
    input~"s";`.levelSelect.currentSelection set (.levelSelect.currentSelection+1) mod count LEVEL_SELECT_OPTIONS;
    input~"a";.levelSelect.horizontalInput[.levelSelect.currentSelection;-1];
    input~"d";.levelSelect.horizontalInput[.levelSelect.currentSelection;1];
    input~"z";.levelSelect.horizontalInput[.levelSelect.currentSelection;-5];
    input~"c";.levelSelect.horizontalInput[.levelSelect.currentSelection;5];
    input in "e ";.levelSelect.select .levelSelect.currentSelection;
    ()
  ];
 };

.levelSelect.resetToDefaults:{[]
  .levelSelect.args[`gameLevel]:DEFAULT_GAME_LEVEL;
  .levelSelect.args[`randomiserMode]:DEFAULT_RANDOMISER;
  .levelSelect.args[`numShownInQueue]:DEFAULT_NUM_SHOWN_IN_QUEUE;
  .levelSelect.args[`canHoldPieces]:DEFAULT_CAN_HOLD_PIECES;
  .levelSelect.args[`showGuidePiece]:DEFAULT_SHOW_GUIDE;
  .levelSelect.args[`allowWallKicks]:DEFAULT_ALLOW_WALL_KICKS;
  .levelSelect.args[`allowFloorKicks]:DEFAULT_ALLOW_FLOOR_KICKS;
 };

.levelSelect.horizontalInput:{[selection;amount]
  selected:LEVEL_SELECT_OPTIONS selection;
  
  $[
    selected~`gameLevel;.levelSelect.args[`gameLevel]:min(max(amount+.levelSelect.args`gameLevel;0);29);
    1<>abs amount;();
    selected~`randomiserMode;[
      randomiserOptions:`modern`nes`fullyRandom;

      currentIndex:first where .levelSelect.args[`randomiserMode]=randomiserOptions;
      newIndex:(currentIndex+amount) mod count randomiserOptions;

      .levelSelect.args[`randomiserMode]:randomiserOptions newIndex;
    ];
    selected~`numShownInQueue;.levelSelect.args[`numShownInQueue]:(amount+.levelSelect.args`numShownInQueue) mod 5;
    ()
  ];
 };

.levelSelect.select:{[selection]
  selected:LEVEL_SELECT_OPTIONS selection;

  $[
    selected~`play;.levelSelect.confirm[];
    selected in LEVEL_SELECT_TOGGLE_OPTIONS;.levelSelect.toggle selection;
    ()
  ];
 };

.levelSelect.confirm:{[]
  startScene[`tetris;.levelSelect.args];
 };

.levelSelect.toggle:{[selection]
  selected:LEVEL_SELECT_OPTIONS selection;

  .levelSelect.args[selected]:not .levelSelect.args selected;
 };
