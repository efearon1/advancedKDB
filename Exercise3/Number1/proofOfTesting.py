//N.B. csv filepath has been hardcoded into csvAPI.py script (line 30)
//cd to Exercise3/Number1 directory
  
//start tickerplant
(qpython) efearon_kx_com@advanced-kdb:~/Exercise3/Number1$ q tick.q sym -p 6225
KDB+ 4.0 2022.04.15 Copyright (C) 1993-2022 Kx Systems
l64/ 2(2)core 7978MB efearon_kx_com advanced-kdb 10.154.0.3 EXPIRE 2023.12.07 dcrossey@kx.com KXMS KXCE #79597

"kdb+tick 2.8 2014.03.12"
q)

//start RDB
(qpython) efearon_kx_com@advanced-kdb:~/Exercise3/Number1$ q tick/r.q localhost:6225 localhost:6228 -p 6226
KDB+ 4.0 2022.04.15 Copyright (C) 1993-2022 Kx Systems
l64/ 2(2)core 7978MB efearon_kx_com advanced-kdb 10.154.0.3 EXPIRE 2023.12.07 dcrossey@kx.com KXMS KXCE #79597

q)

//run csvAPI.py script
(qpython) efearon_kx_com@advanced-kdb:~/Exercise3/Number1$ python csvAPI.py
[INFO] Retrieving PY_TP_PORT...
Located PY_TP_PORT path: 6225
[INFO] Reading CSV file...
[INFO] Publising row to TP...
[INFO] Publising row to TP...
[INFO] Publising row to TP...
(qpython) efearon_kx_com@advanced-kdb:~/Exercise3/Number1$ 

//check RDB --> data populated
q)trade
time                 sym  price size
------------------------------------
0D20:57:59.594350000 IBM  9     15  
0D20:57:59.594647000 AAPL 2     20  
0D20:57:59.594908000 MSFT 10    5 
