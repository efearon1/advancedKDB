//q eod.q -tpLog ${TP_LOG_DIR}/sym2023.01.01 -hdbDir ${KDB_HOME}/hdb

system"l ",getenv[`TICK_DIR],"/sym.q";

upd:{[t;d] if[t in tables[]; t insert d];};

args:.Q.opt .z.x;

tpLog:hsym `$first args`tpLog;
hdbDir:hsym `$first args`hdbDir;
date:"D"$-10#first args`tpLog;

-11!tpLog;

.Q.dpft[hdbDir;date;`sym;] each tables `.;

//convert saved data to compressed format using -19!
compressCols:raze ` sv/:' ((dir,`$string date),/:tables`),/:'(cols each tables`)except\: `time`sym;
{-19!(x;x;16;2;6)} each compressCols;



