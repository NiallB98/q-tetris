.common.cls:{
  if[DEBUG_NO_CLS;-1"DEBUG Cleared screen";:()];
  
  1"\033[H\033[2J\033[3J";
 };

.common.getLevelNames:{[]
  dir:`:../../resources/levels;
  :`$_[-4]each string key[dir] where key[dir] like "*.txt";
 };

.common.quitGame:{[]
  .common.cls[];
  -1"Thank you for playing!\n";
  exit 0;
 };

.common.centreLvl:{[lvl]
  splitLvl:"\n" vs lvl;

  lvlWidth:count first splitLvl;
  termSize:@[{"J"$first system x};"tput cols";0];

  spacesCount:0|(floor termSize%2)-floor lvlWidth%2;

  :"\n" sv ,[spacesCount#" "]each splitLvl;
 };
