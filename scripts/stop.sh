source ~/advancedKDB/config/env.sh
cd ${KDB_HOME}

TICK_ON=$(ps -ef | grep -v grep | grep tick.q | wc -l)
RDB1_ON=$(ps -ef | grep -v grep | grep rdb1.q | wc -l)
RDB2_ON=$(ps -ef | grep -v grep | grep rdb2.q | wc -l)
FEED_ON=$(ps -ef | grep -v grep | grep feed.q | wc -l)
CEP_ON=$(ps -ef | grep -v grep | grep cep.q | wc -l)

echo "Do you wish to shut down all processes?, (y/n)"
read all
if [ "$all" = "y" ]; then
    if [ $TICK_ON -eq 1 ]; then
        echo "Shutting down the tickerplant"
        lsof -i :${TP_PORT} | grep LISTEN | awk '{print $2}' | xargs kill -9
    else
        echo "Tickerplant wasn't running"
    fi

    if [ $RDB1_ON -eq 1 ]; then
        echo "Shutting down RDB1"
        lsof -i :${RDB1_PORT} | grep LISTEN | awk '{print $2}' | xargs kill -9
    else
        echo "RBD1 wasn't running"
    fi

    if [ $RDB2_ON -eq 1 ]; then
        echo "Shutting down RDB2"
        lsof -i :${RDB2_PORT} | grep LISTEN | awk '{print $2}' | xargs kill -9
    else
        echo "RDB2 wasn't running"
    fi

    if [ $FEED_ON -eq 1 ]; then
        echo "Shutting down the feedhandler"
        lsof -i :${FH_PORT} | grep LISTEN | awk '{print $2}' | xargs kill -9
    else
        echo "Feedhandler wasn't running"
    fi

    if [ $CEP_ON -eq 1 ]; then
        echo "Shutting down the CEP"
        lsof -i :${CEP_PORT} | grep LISTEN | awk '{print $2; exit}' | xargs kill -9
    else
        echo "CEP wasn't running"
    fi
    
else
    echo "Do you wish to shut down the tickerplant?, (y/n)"
    read tick
    if [ "$tick" = "y" ]; then
        if [ $TICK_ON -eq 1 ]; then
            echo "Shutting down the tickerplant"
            lsof -i :${TP_PORT} | grep LISTEN | awk '{print $2}' | xargs kill -9
        else
            echo "Tickerplant wasn't running"
        fi
    fi
        
    echo "Do you wish to shut down RDB1?, (y/n)"
    read rdb1
    if [ "$rdb1" = "y" ]; then
        if [ $RDB1_ON -eq 1 ]; then
            echo "Shutting down RDB1"
            lsof -i :${RDB1_PORT} | grep LISTEN | awk '{print $2}' | xargs kill -9
        else
            echo "RDB1 wasn't running"
        fi
    fi

    echo "Do you wish to shut down RDB2?, (y/n)"
    read rdb2
    if [ "$rdb2" = "y" ]; then
        if [ $RDB2_ON -eq 1 ]; then
            echo "Shutting down the tickerplant"
            lsof -i :${RDB2_PORT} | grep LISTEN | awk '{print $2}' | xargs kill -9
        else
            echo "RDB2 wasn't running"
        fi
    fi

    echo "Do you wish to shut down the feedhandler?, (y/n)"
    read feed
    if [ "$feed" = "y" ]; then
        if [ $FEED_ON -eq 1 ]; then
            echo "Shutting down the feedhandler"
            lsof -i :${FH_PORT} | grep LISTEN | awk '{print $2}' | xargs kill -9
        else
            echo "Feedhandler wasn't running"
        fi
    fi

    echo "Do you wish to shut down the CEP?, (y/n)"
    read cep
    if [ "$cep" = "y" ]; then
        if [ $CEP_ON -eq 1 ]; then
            echo "Shutting down the CEP"
            lsof -i :${CEP_PORT} | grep LISTEN | awk '{print $2}' | xargs kill -9
        else
            echo "CEP wasn't running"
        fi
    fi 
fi
