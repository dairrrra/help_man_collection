#!/bin/sh

# 引数1にAPIのファイル名を入力してください

if [ "$1" = "" ]
then
    echo "引数にAPIのファイル名を入力してください(例: ./proZip.sh gate.js)"
    exit 1
fi

api=${1%.js}

echo "${api}とnode_modulesをZipしますか?"
echo "node_modulesはプロダクションに変えちゃいますので！ y/n (zipのみ z)"
read ans
if [ ${ans} = "y" ]
then
    echo "start"
elif [ ${ans} = "z" ]
then 
    echo "zip化します"
    zip -r ./${api}.zip ${api}.js node_modules/
    echo "Zip完了です"
    exit 1
else
    echo "stop"
    exit 1
fi

echo "プロダクションをいれます"
rm -rf node_modules/
wait $!
npm install --production
wait $!
echo "zip化します"
zip -r ./${api}.zip ${api}.js node_modules/
echo "Zip完了です"
echo "node_modulesを戻しますか y/n"
read ans
if [ ${ans} = "y" ]
then
    echo "start"
else
    echo "end"
    exit 1
fi

rm -rf node_modules/
wait $!
echo $?
echo "npm installします"
npm install