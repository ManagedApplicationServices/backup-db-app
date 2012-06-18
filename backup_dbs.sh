#!/bin/bash

src=`pwd`
fdate=`date +%Y-%b-%d`

for dir in `ls $src/`
do
  if [ -d "$src/$dir" ]; then
    echo Backing up $dir ...
    cd $dir
    db=`cat .db`
    pg_dump -h localhost -U postgres -Fc --no-acl --no-owner $db -f $fdate-$db.dump.psql 
    cd $src
  fi
done
echo Completed backing up all databases.


