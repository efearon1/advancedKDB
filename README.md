# advancedKDB

Configuration file `env.sh` located in `advancedKDB/config` directory.
Adjust accorindgly, then set the environment 
```bash
$ ./config/env.sh
```

## Exercise 1
###Number 1-5
Each of the processes can be started as such:
####Tickerplant
`nohup q ${KDB_HOME}/tick.q sym ${TP_LOG_DIR} -p ${TP_PORT} >> ${LOG_DIR}/tick.log 2>&1 &`
####RDB1
`nohup q ${TICK_DIR}/rdb1.q -p ${RDB1_PORT} -tp ${TP_PORT} -hdb ${HDB_PORT} -tabs trade quote >> ${LOG_DIR}/rdb1.log 2>&1 &`
