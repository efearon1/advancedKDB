//eod.q 

system"l ",getenv[`TICK_DIR],"/sym.q";

upd:{[t;d] if[t in tables[]; t insert d];};

hdbDir:

