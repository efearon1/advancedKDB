/q tick/cep.q -p {CEP_PORT} -tp {TP_PORT}  -tabs trade quote

\l tick/log.q

args:.Q.opt .z.x;

h:hopen `$"::",first args`tp;

upd:{[t;d] 
    if[t in `trade`quote;t insert d];
    aggData:`time`sym xcols update time:.z.N from 0!(select maxTrade:max price, minTrade:min price, tradedVolume:sum size by sym from trade) lj (select maxBid:max bid, minAsk:min ask by sym from quote);
    h(`.u.upd;`aggregation;value flip aggData);
    };
    
