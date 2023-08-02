# advancedKDB

Configuration file `env.sh` located in `advancedKDB/config` directory.
Adjust accorindgly, then set the environment:
```bash
$ ./config/env.sh
```

## Exercise 1 
### Number 1-5
Each of the processes can be started from the `advancedKDB` directory as such:
#### Tickerplant
```bash
$ nohup q ${KDB_HOME}/tick.q sym ${TP_LOG_DIR} -p ${TP_PORT} >> ${LOG_DIR}/tick.log 2>&1 &
```
#### RDB1
```bash
$ nohup q ${TICK_DIR}/rdb1.q -p ${RDB1_PORT} -tp ${TP_PORT} -hdb ${HDB_PORT} -tabs trade quote >> ${LOG_DIR}/rdb1.log 2>&1 &
```
#### RDB2
```bash
$ nohup q ${TICK_DIR}/rdb2.q -p ${RDB2_PORT} -tp ${TP_PORT} -hdb ${HDB_PORT} -tabs aggregation >> ${LOG_DIR}/rdb2.log 2>&1 &
```
#### Feedhandler
```bash
$ nohup q ${TICK_DIR}/feed.q -p ${FH_PORT} >> ${LOG_DIR}/feed.log 2>&1 &
```
#### CEP
```bash
$ nohup q ${TICK_DIR}/cep.q -p ${CEP_PORT} -tp ${TP_PORT} -tabs trade quote >> ${LOG_DIR}/cep.log 2>&1 &
```
### Number 6
The scripts can be found in `advancedKDB/scripts` directory. Each script can be executed from `advancedKDB` directory as follows:
#### Start
```bash
$ . ./scripts/start.sh
```
#### Test
```bash
$ . ./scripts/test.sh
```
#### Stop
```bash
$ . ./scripts/stop.sh
```
### Number 7 - Tickerplant log replay
```bash
$ q tpLogReplay.q -tpLogFile /path/to/tpLog -tabFilter trade -symFilter IBM.N
```
### Number 8 - CSV File Load
```bash
$ q tick/csvFileLoad.q -tab trade -fileName ${CSV_DIR}/trade.csv
$ q tick/csvFileLoad.q -tab quote -fileName ${CSV_DIR}/quote.csv
$ q tick/csvFileLoad.q -tab aggregation -fileName ${CSV_DIR}/aggregation.csv
```
### Number 9 - EOD Process
```bash
$ q tick/eod.q -tpLog ${TP_LOG_DIR}/sym2023.01.01 -hdbDir ${KDB_HOME}/hdb
```
