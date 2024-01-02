pre:{
  loadLevels[];

  value"\\S ",string`int$.z.t;  // Randomising the random seed based on the curent time

  -1"Starting game . . .";
 };

loadLevels:{
  -1"Loading level data . . .";

  loadLevel each getLevelNames[];

  -1"All level data loaded";
 };

loadLevel:{[lvl]
  file:"../../resources/levels/",string[lvl],".txt";

  -1"Loading ",file," . . .";
  assignLevel[lvl] "\n" sv read0`$":",file;
  -1"Loaded";
 };

assignLevel:{[lvl;data]
  $[`;".",string[lvl],".level"] set data;
 };

getLevelNames:{[]
  dir:`:../../resources/levels;
  :`$_[-4]each string key[dir] where key[dir] like "*.txt";
 };
