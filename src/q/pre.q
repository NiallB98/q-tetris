assignLevel:{[lvl;data]
  $[`;".",string[lvl],".level"] set data;
 };

loadLevel:{[lvl]
  file:"../../resources/levels/",string[lvl],".txt";

  -1"Loading ",file," . . .";
  assignLevel[lvl] "\n" sv read0`$":",file;
  -1"Loaded";
 };

loadLevels:{
  -1"Loading level data . . .";

  loadLevel each LEVELS;

  -1"All level data loaded";
 };

pre:{
  loadLevels[];

  value"\\S ",string`int$.z.t;  // Randomising the random seed based on the curent time

  -1"Starting game . . .";
 };
