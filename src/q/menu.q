system"l menu/inputLogic.q";
system"l menu/draw.q";

MENU_OPTIONS:`play`quit;

.menu.currentSelection:0;

.menu.start:{[args]
  draw[];
 };

.menu.process:{[input]
  .menu.inputLogic input;
 };

.menu.draw:{[]
  lvl:.menu.level;

  lvl:.menu.drawVersion[lvl;VERSION];
  lvl:.menu.drawCursor lvl;
  lvl:.menu.drawPrompt lvl;

  lvl:.common.centreLvl lvl;

  -1 lvl;
 };
