echo "Checking which processes are running..."

TICK=$(ps -ef | grep -v grep | grep tick.q | wc -l)
RDB1=$(ps -ef | grep -v grep | grep rdb1.q | wc -l)
RDB2=$(ps -ef | grep -v grep | grep rdb2.q | wc -l)
FEED=$(ps -ef | grep -v grep | grep feed.q | wc -l)
CEP=$(ps -ef | grep -v grep | grep cep.q | wc -l)

if [ $TICK -eq 1 ]; then
    echo "Tickerplant is running"
else
    echo "Tickerplant is down"
fi

if [ $RDB1 -eq 1 ]; then
    echo "RDB1 is running"
else
    echo "RDB1 is down"
fi

if [ $RDB2 -eq 1 ]; then
    echo "RDB2 is running"
else
    echo "RDB2 is down"
fi

if [ $FEED -eq 1 ]; then
    echo "Feedhandler is running"
else
    echo "Feedhandler is down"
fi

if [ $CEP -eq 1 ]; then
    echo "CEP is running"
else
    echo "CEP is down"
fi

echo "Check complete"
