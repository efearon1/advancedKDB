/q tick/cep.q -p {CEP_PORT} -tp {TP_PORT}  -tabs trade quote

\l tick/log.q

if[not "w"=first string .z.o;system "sleep 1"];

args:.Q.opt .z.x;

h:hopen `$"::",first args`tp;

upd:{[t;d] 
    if[t in `trade`quote;t insert d];
    aggData:`time`sym xcols update time:.z.N from 0!(select maxTrade:max price, minTrade:min price, tradedVolume:sum size by sym from trade) lj (select maxBid:max bid, minAsk:min ask by sym from quote);
    h(`.u.upd;`aggregation;value flip aggData);
    };
    
.u.rep:{if[0>type first x;x:enlist x];(.[;();:;].)each x;if[null first y;:()];-11!y;system "cd ",1_-10_string first reverse y};

.u.rep .(hopen `$"::",first args`tp)"(.u.sub[`",("`" sv args`tabs),";`];`.u `i`L)";

.u.end:{{delete from x}each tables `. };
