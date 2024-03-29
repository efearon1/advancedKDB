# advancedKDB

Configuration file `env.sh` located in `advancedKDB/config` directory.
Adjust accorindgly, then set the environment:
```bash
$ . ./config/env.sh
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
### Number 10 - Schema Change
Older partitions wouldn't have the new column.

Update sym.q schema file with new column, restart tickerplant and RDB to pick up changes.
For HDB, use addCol function of dbmaint.q script. 
Ensures new column name is valid (and not a reserved word), fills column with chosen default value and updates .d file across all partitions.

## Exercise 2
All solutions can be found under `advancedKDB/Exercise2` directory.

## Exercise 3
### Number 1 - Python
Details can be found within `advancedKDB/Exercise3/Number1/proofOfTesting.txt` file.  
Please note - the csv filepath has been hardcoded into the `csvAPI.py` file (line 30). Update if required.
1. cd to `Exercise3/Number1` directory
2. Start tickerplant (note - if you use different port number, you will need to update `PY_TP_PORT` variable in env.sh file.
```bash
~/Exercise3/Number1$ q tick.q sym -p 6225
```
3. Start RDB
```bash
~/Exercise3/Number1$ q tick/r.q localhost:6225 localhost:6228 -p 6226
```
4. Run python script
```bash
~/Exercise3/Number1$ python csvAPI.py
```
### Number 2 - Java
Details can be found within `advancedKDB/Exercise3/Number2/proofOfTesting.txt` file.  
Please note - the CSV filepath has been hardcoded into the `/Exercise3/Number2/feedhandler/src/main/java/fh/FeedHandler.java` file (line 12). Please update accordingly.  
Change port numbers if needed.
1. cd to `Exercise3/Number2` directory
2. Start tickerplant
   ```bash
   ~/Exercise3/Number2$ q tick.q sym $(pwd)/OnDiskDB -p 5000
   ```
3. Start RDB
   ```bash
   ~/Exercise3/Number2$ q tick/r.q localhost:5000 localhost:5002 -p 5001
   ```
4. cd into `feedhandler` directory
5. Build feedhandler
   ```java
   ~/Exercise3/Number2/feedhandler$ javac \
   > -sourcepath "src/main/java" \
   > -d "target/classes" \
   > src/main/java/fh/FeedHandler.java
   ```
6. Execute feedhandler
   ```bash
   ~/Exercise3/Number2/feedhandler$ java -cp "target/classes" fh.FeedHandler
   ```
### Number 3 - Websocket
1. Start pubsub.q (Note - if you use a different port, you will need to adjust the `WS_PORT` variable within the config/env.sh file)
```bash
$ q Exercise3/Number3/pubsub.q -p 6215
```
2. Start fh.q 
```bash
$ q Exercise3/Number3/fh.q
```
3. Open HTML file in web browser.
It will look like this:
![advancedKDB_1](https://github.com/efearon1/advancedKDB/assets/125225643/9d565b49-038d-4b57-a6cd-be7dd6141526)
You can then use the selection boxes to filter on any symbol:
![advancedKDB_2](https://github.com/efearon1/advancedKDB/assets/125225643/31e7cec8-3582-4c8a-b895-e6f1d73a82b9)







