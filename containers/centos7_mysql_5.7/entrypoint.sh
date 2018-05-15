#!/usr/bin/env bash

rm -rf /var/lib/mysql/*
mysqld --initialize-insecure --user=mysql
chown -R mysql:mysql /var/lib/mysql
mysqld --user=mysql --explicit_defaults_for_timestamp  &
sleep 5

cd /test_db
mysql < employees.sql 2>&1 >>/dev/null

cd /
git clone $FORK 2>>/dev/null >>/dev/null
cd /holland
git checkout $BRANCH 2>>/dev/null >>/dev/null
python setup.py install 2>>/dev/null >>/dev/null
for i in `ls -d /holland/plugins/holland.*`
do
    cd ${i}
    python setup.py install 2>>/dev/null >>/dev/null
done
mkdir -p /etc/holland/providers /etc/holland/backupsets /var/log/holland /var/spool/holland
cp /holland/config/holland.conf /etc/holland/
cp /holland/config/providers/* /etc/holland/providers/
holland mc --name mysqldump mysqldump
#holland mc --name xtrabackup xtrabackup
holland bk mysqldump
#holland bk xtrabackup
