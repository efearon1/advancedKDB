source ~/advancedKDB/config/env.sh
cd ${KDB_HOME}

TICK_START="nohup ~/q/${Q_OS}/q ${KDB_HOME}/tick.q sym ${TP_LOG_DIR} -p ${TP_PORT} </dev/null >> ${LOG_DIR}/tick.log 2>&1 &"
RDB1_START="nohup ~/q/${Q_OS}/q ${TICK_DIR}/rdb1.q -p ${RDB1_PORT} -tp ${TP_PORT} -hdb ${HDB_PORT} -tabs trade quote </dev/null >> ${LOG_DIR}/rdb1.log 2>&1 &"
RDB2_START="nohup ~/q/${Q_OS}/q ${TICK_DIR}/rdb2.q -p ${RDB2_PORT} -tp ${TP_PORT} -hdb ${HDB_PORT} -tabs aggregation </dev/null >> ${LOG_DIR}/rdb2.log 2>&1 &"
FEED_START="nohup ~/q/${Q_OS}/q ${TICK_DIR}/feed.q -p ${FH_PORT} </dev/null >> ${LOG_DIR}/feed.log 2>&1 &"
CEP_START="nohup ~/q/${Q_OS}/q ${TICK_DIR}/cep.q -p ${CEP_PORT} -tp ${TP_PORT} -tabs trade quote </dev/null >> ${LOG_DIR}/cep.log 2>&1 &"


echo "Do you wish to start all processes?, (y/n)"
read all
if [ "$all" = "y" ]; then
        echo "Starting all processes..."
        echo "Starting the tickerplant..."
        eval ${TICK_START}
        sleep 2
        echo "Starting rdb1..."
        eval ${RDB1_START}
        sleep 2
        echo "Starting rdb2..."
        eval ${RDB2_START}
        sleep 2
        echo "Starting the feedhandler..."
        eval ${FEED_START}
        sleep 2
        echo "Starting the CEP..."
        eval ${CEP_START}
else
    echo "Do you wish to start the tickerplant?, (y/n)"
    read tick
    if [ "$tick" = "y" ]; then
        echo "Starting the tickerplant..."
        eval ${TICK_START}
        sleep 2
    fi

    echo "Do you wish to start rdb1?, (y/n)"
    read rdb1
    if [ "$rdb1" = "y" ]; then
        echo "Starting rdb1..."
        eval ${RDB1_START}
    fi
    
    echo "Do you wish to start rdb2?, (y/n)"
    read rdb2
    if [ "$rdb2" = "y" ]; then
        echo "Starting rdb2..."
        eval ${RDB2_START}
    fi
    
    echo "Do you wish to start the feedhandler?, (y/n)"
    read feed
    if [ "$feed" = "y" ]; then
        echo "Starting the feedhandler..."
        eval ${FEED_START}
        sleep 2
    fi
    
    echo "Do you wish to start the CEP?, (y/n)"
    read cep
    if [ "$cep" = "y" ]; then
        echo "Starting the CEP..."
        eval ${CEP_START}
    fi 
fi
