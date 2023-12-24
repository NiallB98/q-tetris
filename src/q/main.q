system"l debug.q";
system"l common.q";
system"l pre.q";
system"l animation.q";
system"l menu.q";
system"l tetris.q";
system"l levelSelect.q";

VERSION:"v1.0.0";

.gameLoop.fps:60;
LEVELS:.common.getLevelNames[];

currentScene:`;

.gameLoop.prevSecondTs:.z.p;
.gameLoop.drawNextFrame:0b;

.input.lastInput:"";

main:{[]
  `.gameLoop.fps set 0N!getFPSArg[];

  pre[];
  startScene[`menu;()!()];
  startGameLoop[.gameLoop.fps];
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

  if[input like "fps [0-9][0-9]";
    changeFPS "J"$last " " vs input;
    `input.lastInput set "";
    :();
  ];

  `.input.lastInput set lower last input;
 };

gameLoop:{[]
  if[animationFramesLeft<=0;process .input.lastInput];
  `.input.lastInput set "";

  $[
    .gameLoop.drawNextFrame and animationFramesLeft<=0;draw[];
    animationFramesLeft>0;[runAnimation[];:()];
    ()
  ];
 };

process:{[input]
  value".",string[currentScene],".process",(-3!input);
 };

draw:{[]
  value".",string[currentScene],".draw[]";
  1"[qTetris ",VERSION,"] ";

  `.gameLoop.drawNextFrame set 0b;
 };

startGameLoop:{[fps]
  time:ceiling 1000%fps;

  `.z.ts set {.Q.trp[gameLoop;0;{
        2@"Error: ",x,"\nBacktrace:\n",.Q.sbt y;
        $[DEBUG_ALLOW_CMDS;[value"\\x .z.pi";value"\\t 0";value"\\x .z.ts"];exit 1]
      }
    ]
  };

  value"\\t ",string time;
 };

changeFPS:{[fps]
  `.gameLoop.fps set fps;
  time:ceiling 1000%fps;

  value"\\t ",string time;
 };

getFPSArg:{[]
  argVal:.Q.opt[.z.x]`fps;

  :$[
    0~count argVal;60;
    all first argVal in .Q.n;{$[null x;60;x]}"J"$first argVal;
    60
  ];
 };

main[];
