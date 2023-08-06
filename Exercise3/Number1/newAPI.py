import os
import sys
import csv
import time

from qpython import qconnection
from qpython.qcollection import qlist
from qpython.qtype import QException, QTIME_LIST, QSYMBOL_LIST, QFLOAT_LIST

def info(x):
    print ("[INFO] {}".format(x))

def error(x):
    print ("[ERROR] {}".format(x))

# Get Python TP Port
def getTpPort():
    info ('Retrieving PY_TP_PORT...')
    try:
        global tpPort
        tpPort = os.environ['PY_TP_PORT']
        print ('Located PY_TP_PORT path: '+ tpPort)

    except NameError as error1:
        error ('Unable to find py_TP_PORT env variable. '+ str(error1))
        exit(1)

getTpPort()

if __name__ == '__main__':
    with qconnection.QConnection(host='localhost', port=tpPort) as q:
        print(q)
        print('IPC version: %s. Is connected: %s' % (q.protocol_version, q.is_connected()))
        with open("/home/efearon_kx_com/csv/trade.csv") as file:
            csv_reader = csv.reader(file,delimiter=',')
            row_count = 0

            for row in csv_reader:
                if row_count > 0:
                    row[0] = numpy.string_(row[0])
                    row[2] = numpy.float_(row[2])
                    row[3] = numpy.int_(row[3])

                    q.sendSync('.u.upd','trade',(row[0],row[1],row[2],row[3]))
                row_count += 1



  
