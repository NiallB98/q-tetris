.menu.drawVersion:{[lvl;version]
  lastIndex:first ss[lvl;"%"];
  firstIndex:1+lastIndex-count version;

  versionIndices:firstIndex+til 1+lastIndex-firstIndex;
  lvl[versionIndices]:version;

  :lvl;
 };

.menu.drawCursor:{[lvl]
  leftIndex:(.menu.cursorIndices`left) .menu.currentSelection;
  rightIndex:(.menu.cursorIndices`right) .menu.currentSelection;

  lvl[leftIndex]:">";
  lvl[rightIndex]:"<";

  :ssr[ssr[lvl;"@";" "];"&";" "];
 };
