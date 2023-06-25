//q tick/rdb2.q -p {RDB2_PORT} -tp {TP_PORT} -hdb {HDB_PORT} -tabs aggregation

//load in logging script
\l tick/log.q

args:.Q.opt .z.x;

if[not "w"=first string .z.o;system "sleep 1"];

upd:{if[x in `aggregation; x insert y]};

/ get the ticker plant and history ports, defaults are 5010,5012
/.u.x:.z.x,(count .z.x)_(":5010";":5012");

/ end of day: save, clear, hdb reload
.u.end:{t:tables`.;t@:where `g=attr each t@\:`sym;.Q.hdpf[`$"::",first args`hdb;`:.;x;`sym];@[;`sym;`g#] each t;};

/ init schema and sync up from log file;cd to hdb(so client save can run)
.u.rep:{(.[;();:;].)each x;if[null first y;:()];-11!y;system "cd ",1_-10_string first reverse y};
/ HARDCODE \cd if other than logdir/db

/ connect to ticker plant for (schema;(logcount;log))
.u.rep .(hopen `$"::",first args`tp)"(.u.sub[`$first args`tabs;`];`.u `i`L)";
