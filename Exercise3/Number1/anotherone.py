#!/usr/bin/env python2

import datetime
import numpy
import sys
import time
import subprocess
import csv

from qpython import qconnection
from qpython.qcollection import qlist
from qpython.qtype import QException, QTIME_LIST, QSYMBOL_LIST, QFLOAT_LIST,QSYMBOL
from numpy import genfromtxt

convs = dict.fromkeys([0, 1], bytes.decode)

if __name__ == '__main__':
    with qconnection.QConnection(host='localhost', port=6225) as q:
        print(q)
        print('IPC version: %s. Is connected: %s' % (q.protocol_version, q.is_connected()))
        data = q.sendSync('{`long$ til x}', 10)
        print('type: %s, numpy.dtype: %s, meta.qtype: %s, data: %s ' % (type(data), data.dtype, data.meta.qtype, data))
        with open("/home/efearon_kx_com/csv/trade.csv") as file:
            csvreader = csv.reader(file)
            for row in csvreader:
                print(row[0])
                q.sendSync('.u.upd', 'trade', (row[0],row[1],row[2],row[3])
                time.sleep(1)


with qconnection.QConnection(host='localhost', port=6225) as q:
    print(q)
    print('IPC version: %s. Is connected: %s' % (q.protocol_version, q.is_connected()))
