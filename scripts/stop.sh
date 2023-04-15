source ~/advancedKDB/config/env.sh
cd ${KDB_HOME}

TICK_ON=$(ps -ef | grep -v grep | grep tick.q | wc -l)
RDB1_ON=$(ps -ef | grep -v grep | grep rdb1.q | wc -l)
RDB2_ON=$(ps -ef | grep -v grep | grep rdb2.q | wc -l)
FEED_ON=$(ps -ef | grep -v grep | grep feed.q | wc -l)
CEP_ON=$(ps -ef | grep -v grep | grep cep.q | wc -l)

echo "Do you wish to stop all processes?, (y/n)
