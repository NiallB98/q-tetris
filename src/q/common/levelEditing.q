.common.levelEdit.replaceAll:{[lvl;char;newChar]
  :ssr[lvl;char;newChar];
 };

.common.levelEdit.replaceOne:{[lvl;char;newChar;charNum;otherChar]
  indices:lvl ss char;
  lvl[indices[charNum]]:newChar;

  :.common.levelEdit.replaceAll[lvl;char;otherChar];
 };

.common.levelEdit.setLen:{[size;str;align]
  c:count str;
  if[c>=size;:size#str];

  $[
    align~`left;[lNum:0;rNum:size-c];
    align~`right;[lNum:size-c;rNum:0];
    [lNum:floor (size-c)%2;rNum:ceiling (size-c)%2]
  ];

  :#[lNum;" "],str,rNum#" ";
 };

.common.levelEdit.showMsg:{[lvl;msg;tgtStr;align]
  msg:.common.levelEdit.setLen[count tgtStr;msg;align];
  :.common.levelEdit.replaceAll[lvl;tgtStr;msg];
 };

.common.levelEdit.autoShowMsg:{[lvl;msg;tgtChar;align]
  tgtChar;
  num:.common.getNumChars[lvl;tgtChar];
  :.common.levelEdit.showMsg[lvl;msg;num#tgtChar;align];
 };
