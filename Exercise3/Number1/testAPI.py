import datetime
import numpy
import random
import threading
import sys
import time
import os
import csv

from qpython import qconnection
from qpython.qcollection import qlist
from qpython.qtype import QException, QTIME_LIST, QSYMBOL_LIST, QFLOAT_LIST

def info(x):
    print ("[INFO] {}".format(x))

def error(x):
    print ("[ERROR] {}".format(x))

def kdbConnect():
    info ('Retrieving TP port for Python API')
    try:
        port = os.environ['PY_TP_PORT']
        print ('Python Tickerplant Port:', port)

    except NameError as error:
        error ('Unable to find TP env variable. ' + str(error))
        exit(1)

    # Establish a connection to the kdb TP process
    info ('Establishing connection to the TP process...')
    try: 
        global handle
        handle = q.hopen('::'+ port)
        print ('Opened a handle to the Python TP process: {}'.format(handle))
    except Exception as exception:
        error ('Unable to connect to the Python TP process ' + str(exception))
        exit(1)

def convertTimeToLong(timeValue):
    timeArray = time.strptime(timeValue,'%H:%M:%S.%f')
    # Sample output: time.struct_time(tm_year=1900, tm_mon=1, tm_mday=1, tm_hour=14, tm_min=53, tm_sec=10, tm_wday=0, tm_yday=1, tm_isdst=-1)
    # We need to multiply by 10^9 at the end as kdb timespan precision is up to the nano second
    return ((timeArray.tm_hour * 60 + timeArray.tm_min) * 60 + timeArray.tm_sec) * 10**9

def publishCSV():
    with open("/home/efearon_kx_com/csv/trade.csv", 'r') as file:
        csvreader = csv.reader(file, delimiter=',')
        row_count=0
  
        for row in csvreader:
            if row_count > 0:
                row[0] = numpy.string_(row[0])
                row[2] = numpy.float_(row[2])
                row[3] = numpy.int_(row[3])

                handle(('.u.upd','trade',(row[0],row[1],row[2],row[3])))
            row_count += 1
 
kdbConnect()
publishCSV()
exit()
