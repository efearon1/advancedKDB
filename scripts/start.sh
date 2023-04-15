source ~/advancedKDB/config/env.sh
cd ${KDB_HOME}

TICK_START="nohup ~/q/${Q_OS}/q ${KDB_HOME}/tick.q sym ${TP_LOG_DIR} -p ${TP_PORT} </dev/null >> ${LOG_DIR}/tick.log 2>&1 &"
RDB1_START="nohup ~/q/${Q_OS}/q ${TICK_DIR}/rdb1.q -p ${RDB1_PORT} -tp {TP_PORT} -hdb {HDB_PORT} -tabs trade quote </dev/null >> ${LOG_DIR}/rdb1.log 2>&1 &"
RDB2_START="nohup ~/q/${Q_OS}/q ${TICK_DIR}/rdb2.q -p ${RDB2_PORT} -tp {TP_PORT} -hdb {HDB_PORT} -tabs aggregation </dev/null >> ${LOG_DIR}/rdb2.log 2>&1 &"
FEED_START="nohup ~/q/${Q_OS}/q ${TICK_DIR}/feed.q -p ${FH_PORT} </dev/null >> ${LOG_DIR}/feed.log 2>&1 &"
CEP_START="nohup ~/q/${Q_OS}/q ${TICK_DIR}/cep.q -p ${CEP_PORT} -tp {TP_PORT} -tabs trade quote </dev/null >> ${LOG_DIR}/cep.log 2>&1 &"


echo "Do you wish to start all processes?, (y/n)"
read all
if [ "$all" = "y" ]; then
        echo "Read all"
else
    echo "Do you wish to start the tickerplant?, (y/n)"
    read tick
    if [ "$tick" = "y" ]; then
        echo "read tick"
    fi

    echo "Do you wish to start rdb1?, (y/n)"
    read rdb1
    if [ "$rdb1" = "y" ]; then
        echo "read rdb1"
    fi
    
    echo "Do you wish to start rdb2?, (y/n)"
    read rdb2
    if [ "$rdb2" = "y" ]; then
        echo "read rdb2"
    fi
    
    echo "Do you wish to start the feedhandler?, (y/n)"
    read fh
    if [ "$fh" = "y" ]; then
        echo "read fh"
    fi
    
    echo "Do you wish to start the CEP?, (y/n)"
    read cep
    if [ "$cep" = "y" ]; then
        echo "read cep"
    fi 
fi
