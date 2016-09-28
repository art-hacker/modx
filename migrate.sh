#!/usr/bin/env bash

DB_NAME="ttstore_db";
DB_USER="root";
DB_PASS="1234";



BACKUP=`ls -t /var/www/site/assets/backup/*.sql | head -1`
if [ $BACKUP ]; then
    mysql -u$DB_USER -p$DB_PASS -e "DROP DATABASE IF EXISTS "${DB_NAME}
    mysql -u$DB_USER -p$DB_PASS -e "CREATE DATABASE "${DB_NAME}" CHARACTER SET utf8 COLLATE utf8_general_ci"
    mysql -u$DB_USER -p$DB_PASS -D $DB_NAME < $BACKUP
fi