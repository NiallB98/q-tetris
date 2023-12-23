.levelSelect.drawPrompt:{[lvl]
  searchStr:76#"$";

  prompt:$[
    `gameLevel~LEVEL_SELECT_OPTIONS .levelSelect.currentSelection;"Up/Down [W/S], -1/+1 [A/D], -5/+5 [Z/C]";
    `randomiserMode~LEVEL_SELECT_OPTIONS .levelSelect.currentSelection;"Up/Down [W/S], Left/Right [A/D]";
    `numShownInQueue~LEVEL_SELECT_OPTIONS .levelSelect.currentSelection;"Up/Down [W/S], Left/Right [A/D]";
    `canHoldPieces~LEVEL_SELECT_OPTIONS .levelSelect.currentSelection;"Up/Down [W/S], Toggle [E/Space]";
    `showGuidePiece~LEVEL_SELECT_OPTIONS .levelSelect.currentSelection;"Up/Down [W/S], Toggle [E/Space]";
    `allowWallKicks~LEVEL_SELECT_OPTIONS .levelSelect.currentSelection;"Up/Down [W/S], Toggle [E/Space]";
    `allowFloorKicks~LEVEL_SELECT_OPTIONS .levelSelect.currentSelection;"Up/Down [W/S], Toggle [E/Space]";
    `play~LEVEL_SELECT_OPTIONS .levelSelect.currentSelection;"Up/Down [W/S], Confirm [E/Space]";
    ""
  ];
  prompt:{
    y:y-count x;
    :((floor[y%2]#" "),x),ceiling[y%2]#" ";
  }[prompt;count searchStr];

  :ssr[lvl;searchStr;prompt];
 };

.levelSelect.drawCursor:{[lvl]
  leftIndex:ss[lvl;"@"] .levelSelect.currentSelection;
  rightIndex:ss[lvl;"&"] .levelSelect.currentSelection;

  lvl[leftIndex]:">";
  lvl[rightIndex]:"<";

  :ssr[ssr[lvl;"@";" "];"&";" "];
 };

.levelSelect.drawSelectedOptions:{[lvl]
  lvl:.levelSelect.drawGameLevelOption lvl;
  lvl:.levelSelect.drawPieceRandomiserOption lvl;
  lvl:.levelSelect.drawNumShownInQueueOption lvl;
  lvl:.levelSelect.drawToggleOptions lvl;

  :lvl;
 };

.levelSelect.drawGameLevelOption:{[lvl]
  :ssr[lvl;"00";-2#"00",string .levelSelect.args`gameLevel];
 };

.levelSelect.drawPieceRandomiserOption:{[lvl]
  s:"[[]Modern[]] [[]NES[]] [[]Basic[]]";
  numShownInQueueIndices:(til count "[Modern] [NES] [Basic]")+first ss[lvl;s];

  s:lvl[numShownInQueueIndices];
  bracketsToRemove:til[3] except first where .levelSelect.args[`randomiserMode]=`modern`nes`fullyRandom;
  bracketIndices:raze(ss[s;"[[]"]bracketsToRemove;ss[s;"[]]"]bracketsToRemove);

  s[bracketIndices]:" ";
  lvl[numShownInQueueIndices]:s;

  :lvl;
 };

.levelSelect.drawNumShownInQueueOption:{[lvl]
  s:"[[]0[]] [[]1[]] [[]2[]] [[]3[]] [[]4[]]";
  numShownInQueueIndices:(til count "[0] [1] [2] [3] [4]")+first ss[lvl;s];

  s:lvl[numShownInQueueIndices];
  bracketsToRemove:til[5] except .levelSelect.args`numShownInQueue;
  bracketIndices:raze(ss[s;"[[]"]bracketsToRemove;ss[s;"[]]"]bracketsToRemove);

  s[bracketIndices]:" ";
  lvl[numShownInQueueIndices]:s;

  :lvl;
 };

.levelSelect.drawToggleOptions:{[lvl]
  toggleIndices:+[-1 0 1]each ss[lvl;"[X]"];

  lvl[toggleIndices 0]:$[.levelSelect.args`canHoldPieces;"[X]";"[ ]"];
  lvl[toggleIndices 1]:$[.levelSelect.args`showGuidePiece;"[X]";"[ ]"];
  lvl[toggleIndices 2]:$[.levelSelect.args`allowWallKicks;"[X]";"[ ]"];
  lvl[toggleIndices 3]:$[.levelSelect.args`allowFloorKicks;"[X]";"[ ]"];

  :lvl;
 };
