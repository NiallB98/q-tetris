animationFramesLeft:0;
animationFunc:{[args]};
animationEndFunc:{[args]};
animationArgs:()!();

queueAnimation:{[frames;func;endFunc;args]
  `animationFramesLeft set frames;
  `animationFunc set func;
  `animationEndFunc set endFunc;
  `animationArgs set args;
 };

runAnimation:{[]
  animationFunc[animationArgs];
  if[animationFramesLeft<=1;animationEndFunc[animationArgs]];

  `animationFramesLeft set animationFramesLeft-1;
 };
