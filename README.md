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
The scripts can be found in the `advancedKDB/scripts` directory.  
Proof of testing can be found in `advancedKDB/tick/proofOfTesting.txt` file.  
Each script can be executed from `advancedKDB` directory as follows:
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

## Exercise 2
All solutions can be found under `advancedKDB/Exercise2` directory.

## Exercise 3
### Number 1 - Python
### Number 2 - Java
Details can be found within `advancedKDB/Exercise3/Number2/proofOfTesting.txt` file.  
Change port numbers if needed.
1. Start tickerplant
   ```bash
   ~/Exercise3/Number2$ q tick.q sym $(pwd)/OnDiskDB -p 5000
   ```
2. Start RDB
   ```bash
   ~/Exercise3/Number2$ q tick/r.q localhost:5000 localhost:5002 -p 5001
   ```
3. Build feedhandler
   ```java
   ~/Exercise3/Number2/feedhandler$ javac \
   > -sourcepath "src/main/java" \
   > -d "target/classes" \
   > src/main/java/fh/FeedHandler.java
   ```
4. Execute feedhandler
   ```bash
   ~/Exercise3/Number2/feedhandler$ java -cp "target/classes" fh.FeedHandler
   ```

### Number 3 - Websocket
1. Start pubsub.q
2. Start fh.q
3. Open HTML file in web browser.
It will look like this:
![advancedKDB_1](https://github.com/efearon1/advancedKDB/assets/125225643/b8699176-cc50-4d44-ba2f-d272edd3d58a)
You can then use the selection boxes to filter on any symbol:
![advancedKDB_2](https://github.com/efearon1/advancedKDB/assets/125225643/85cfc6ba-aa68-4800-b8a4-0db3b7c6df01)






