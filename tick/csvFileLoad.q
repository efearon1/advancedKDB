//q csvFileLoad.q -tab trade -fileName ${CSV_DIR}/trade.csv
//q csvFileLoad.q -tab quote -fileName ${CSV_DIR}/quote.csv
//q csvFileLoad.q -tab aggregation -fileName ${CSV_DIR}/aggregation.csv

\l tick/log.q

args:.Q.opt .z.x;

tableName:`$first args`tab;
csvFilePath:hsym `$first args`fileName;

if[tableName in `trade`quote`aggregation; colTypes:$[`trade~tableName;"NSFI";`quote~tableName;"NSFFII";"NSFFFFF"]];
if[not tableName in `trade`quote`aggregation; .log.err["Following table not recognised: ",string tableName]];

data:(colTypes;enlist ",") 0: csvFilePath;

h:hopen "J"$getenv[`TP_PORT];

h(`.u.upd; tableName; value flip data);
