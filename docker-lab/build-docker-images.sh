#!/bin/bash
#build the zev database image locally - mysql database with test tables and records loaded
docker build --platform=linux/amd64 -f zev/Dockerfile.zev -t simonjohngreen/lexx-zev:1.0 zev
#build the giggerota webhook listener and decoder
docker build --platform=linux/amd64 -f giggerota/Dockerfile.giggerota -t simonjohngreen/lexx-giggerota:1.0 giggerota 
#build the tweedle menuu
cp ../tweedle.py tweedle/tweedle.py.copy
cp notes.txt tweedle/notes.txt.copy
docker build --platform=linux/amd64 -f tweedle/Dockerfile.tweedle -t simonjohngreen/lexx-tweedle:1.0 tweedle 
