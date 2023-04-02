// q tpLogReplay.q -tpLogFile /path/to/tpLog -tabFilter trade -symFilter IBM.N

args:.Q.opt .z.x;

tpLogFile:hsym `$first args`tpLogFile;
tabFilter:`$first args`tabFilter;
symFilter:`$first args`symFilter;

newTpLogFile:`$(raze string tpLogFile,"_",string tabFilter),"_",string symFilter;
//initialise and open connection to new log file
h:hopen (newTpLogFile set ());

//redefine upd
upd:{[t;d] 
    if[all(tabFilter~t; symFilter in d[1]);
        data:(flip d)[where symFilter in/: flip d];
        h enlist (`upd;t;flip data)];
        };
        
-11!tpLogFile;  
