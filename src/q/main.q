system"l debug.q";
system"l common.q";
system"l pre.q";
system"l menu.q";
system"l tetris.q";
system"l levelSelect.q";

VERSION:"v0.9.0";

FPS:60;
LEVELS:.common.getLevelNames[];

currentScene:`;

.gameLoop.prevSecondTs:.z.p;
.gameLoop.drawNextFrame:0b;

.input.lastInput:"";

main:{[]
  pre[];
  startScene[`menu;()!()];
  startGameLoop[FPS];
 };

startScene:{[scene;args]
  `currentScene set scene;
  value(`$".",string[currentScene],".start";args);
 };

.z.pi:{[input]
  input:input except "\n";

  if[DEBUG_ALLOW_CMDS and input like "\\*";value 1 _ input;:()];

  .gameLoop.drawNextFrame:1b;

  if[input~"";`.input.lastInput set "";:()];

  if[any like[input]each("*quit";"*exit";"*\\\\");
    .common.quitGame[];
  ];

  if[(currentScene<>`menu) and input like "*menu";
    startScene[`menu;()!()];
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

  `.z.ts set {.Q.trp[gameLoop;0;{
        2@"Error: ",x,"\nBacktrace:\n",.Q.sbt y;
        $[DEBUG_ALLOW_CMDS;[.z.pi:value;value"\\t 0"];exit 1]
      }
    ]
  };

  value"\\t ",string time;
 };

main[];
