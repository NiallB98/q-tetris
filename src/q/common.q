system"l common/levelEditing.q";

.common.cls:{
  if[DEBUG_NO_CLS;-1"DEBUG Cleared screen";:()];
  
  1"\033[3;J\033[H\033[2J";
  1"\033[3;J\033[H\033[2J";
 };

.common.limitLen:{[size;str]
  :$[size>=count str;:str;size#str];
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
