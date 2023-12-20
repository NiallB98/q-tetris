system"l menu/inputLogic.q";
system"l menu/draw.q";

MENU_OPTIONS:`play`quit;

.menu.currentSelection:0;
.menu.cursorIndices:()!();

.menu.start:{[]
  `.menu.cursorIndices set `left`right!(ss[.menu.level;"@"];ss[.menu.level;"&"]);

  draw[];
 };

.menu.process:{[input]
  .menu.inputLogic input;
 };

.menu.draw:{[]
  lvl:.menu.level;

  lvl:.menu.drawVersion[lvl;VERSION];
  lvl:.menu.drawCursor[lvl];

  -1 lvl;
 };
