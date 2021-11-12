#!/bin/bash

for dir in `ls containers|grep -v centos6|grep -v debian8`
do
 docker build -t $dir containers/$dir
done
