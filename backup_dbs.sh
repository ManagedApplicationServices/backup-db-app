#!/bin/bash

src=`pwd`
fdate=`date +%Y-%b-%d`

# `ls $src`
for dir in `ls $src`
do
  if [ -d "$src/$dir" ]; then
    echo backing up $dir ...
    cd $dir
    if [ -f .db ]; then
      db=`cat .db`
      pg_dump -h localhost -U postgres -Fc --no-acl --no-owner $db -f $fdate-$db.dump.psql
    fi
    if [ -f .mongodb ]; then
      db=`cat .mongodb`
      mongodump -h 10.0.0.85 --out ./ --db $db
      tar zcvf $fdate-$db.mongodb.tgz ./$db
      rm -rf ./$db
    fi
    cd $src
  fi
done
