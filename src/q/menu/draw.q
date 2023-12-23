.menu.drawVersion:{[lvl;version]
  lastIndex:first ss[lvl;"%"];
  firstIndex:1+lastIndex-count version;

  versionIndices:firstIndex+til 1+lastIndex-firstIndex;
  lvl[versionIndices]:version;

  :lvl;
 };

.menu.drawCursor:{[lvl]
  leftIndex:ss[lvl;"@"] .menu.currentSelection;
  rightIndex:ss[lvl;"&"] .menu.currentSelection;

  lvl[leftIndex]:">";
  lvl[rightIndex]:"<";

  :ssr[ssr[lvl;"@";" "];"&";" "];
 };

.menu.drawPrompt:{[lvl]
  searchStr:76#"$";

  prompt:"Up/Down [W/S], Select [E/Space]";
  prompt:{
    y:y-count x;
    :((floor[y%2]#" "),x),ceiling [y%2]#" ";
  }[prompt;count searchStr];

  :ssr[lvl;searchStr;prompt];
 };
