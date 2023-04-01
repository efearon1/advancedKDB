//q csvFileLoad.q -tab trade -fileName ${CSV_DIR}/trade.csv
//q csvFileLoad.q -tab quote -fileName ${CSV_DIR}/quote.csv
//q csvFileLoad.q -tab aggregation -fileName ${CSV_DIR}/aggregation.csv

args:.Q.opt .z.x;

tableName:`$first args`tab;
csvFilePath:hsym `$first args`fileName;

if[tableName in `trade`quote`aggregation; colTypes:$[`trade~tableName;"NSFI";`quote~tableName;"NSFFII";"NSFFFFF"]];

data:(colTypes;enlist ",") 0: csvFilePath;

h:hopen "J"$getenv[`TP_PORT];

//h(`.u.upd; tableName; flip get each data);
//h(`.u.upd; tableName; value flip data);
