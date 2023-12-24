animationFramesLeft:0;
animationFunc:{[args]};
animationArgs:()!();

queueAnimation:{[frames;func;args]
  `animationFramesLeft set frames;
  `animationFunc set func;
  `animationArgs set args;
 };

runAnimation:{[]
  animationFunc[animationArgs];
  `animationFramesLeft set animationFramesLeft-1;
 };
