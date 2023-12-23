.menu.inputLogic:{[input]
  if[input~"";:()];

  $[
    input in "ws";.menu.moveCursor input~"s";
    input in "e ";.menu.selectCurrent[];
    ()
  ];
 };

.menu.moveCursor:{[moveDown]
  `.menu.currentSelection set mod[.menu.currentSelection+$[moveDown;1;-1];count MENU_OPTIONS];
 };

.menu.selectCurrent:{[]
  currentOption:MENU_OPTIONS .menu.currentSelection;

  $[
    currentOption~`quit;.common.quitGame[];
    currentOption~`play;startScene[`levelSelect;()!()];
    ()
  ];
 };
