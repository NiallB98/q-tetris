system"l common.q";
system"l pre.q";
system"l menu.q";
system"l tetris.q";

VERSION:"v0.1.0";

FPS:60;
LEVELS:.common.getLevelNames[];

DEBUG_NO_CLS:0b;

currentScene:`;

.gameLoop.prevSecondTs:.z.p;
.gameLoop.drawNextFrame:0b;

.input.lastInput:"";

main:{[]
  pre[];
  startScene`menu;
  startGameLoop[FPS];
 };

startScene:{[scene]
  `currentScene set scene;
  value".",string[currentScene],".start[]";
 };

.z.pi:{[input]
  .gameLoop.drawNextFrame:1b;

  input:input except "\n";

  if[input~"";`.input.lastInput set "";:()];

  if[any like[input]each("*quit";"*exit";"*\\\\");
    .common.quitGame[];
  ];

  if[(currentScene<>`menu) and input like "*menu";
    startScene`menu;
    `input.lastInput set "";
    :();
  ];

  `.input.lastInput set lower last input;
 };

gameLoop:{[]
  process[.input.lastInput];
  `.input.lastInput set "";

  if[.gameLoop.drawNextFrame;draw[]];
 };

process:{[input]
  value".",string[currentScene],".process",(-3!input);
 };

draw:{[]
  .common.cls[];

  value".",string[currentScene],".draw[]";
  1"[qTetris ",VERSION,"] ";

  `.gameLoop.drawNextFrame set 0b;
 };

startGameLoop:{[fps]
  time:ceiling 1000%fps;

  `.z.ts set gameLoop;

  value"\\t ",string time;
 };

main[];
