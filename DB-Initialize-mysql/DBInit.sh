#! /bin/bash

# 接続情報を環境変数から取得します

SQL_CREATE=./table-define.sql
SQL_INITIALIZE=./initialize-data.sql

echo "以下のDBを初期化します"
echo "-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
echo "HOST: "$ENDPOINT
echo "USER: "$USER
echo "DATABASE: "$DATABASE
echo "PASSWORD: "$PASSWORD
echo "-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
echo "本当に初期化しますか y/n"
read ans
if [ ${ans} = "y" ]
then
    echo "start"
else
    echo "stop"
    exit 1
fi
MYSQL_COMMAND_ARGS="-h $ENDPOINT -u $USER --database=$DATABASE"

echo "初期化開始"
MYSQL_PWD=$PASSWORD mysql ${MYSQL_COMMAND_ARGS} < $SQL_CREATE
wait $!
echo "初期化データを追加"
MYSQL_PWD=$PASSWORD mysql ${MYSQL_COMMAND_ARGS} < $SQL_INITIALIZE
echo "Finish!"