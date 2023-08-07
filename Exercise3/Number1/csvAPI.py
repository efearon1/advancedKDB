import os
import csv
import numpy as np
from qpython import qconnection
from qpython.qcollection import qlist
from qpython.qtype import QException, QTIME_LIST, QSYMBOL_LIST, QFLOAT_LIST, QLONG_LIST

def info(x):
    print ("[INFO] {}".format(x))

def error(x):
    print ("[ERROR] {}".format(x))

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
tpPort = int(tpPort)

with qconnection.QConnection(host='localhost', port=tpPort) as q:
    info ('Reading CSV file...')
    with open("/home/efearon_kx_com/csv/trade.csv") as f:
        reader = csv.reader(f, delimiter=",")
        for line in enumerate(reader):
            if (line[1][0] == 'time'):
                continue
            q.sendSync(('.u.upd[`trade;({time};`{sym};{price};{size})]').format(time=line[1][0],sym=line[1][1],price=float(line[1][2]),size=int(line[1][3])))
            info ('Publising row to TP...')
