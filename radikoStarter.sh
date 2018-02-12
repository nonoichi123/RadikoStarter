#!/bin/sh

# ctrl+c を押して強制終了した時、Seleniumサーバを終了させる
trap "kill $pid" 2

# 作業ディレクトリに移動
cd ~/Documents/Develop/radikoStarter

# Seleniumサーバの起動確認
if lsof -i:4444 | grep LISTEN
then
  # Seleniumサーバがすでに起動している場合
  echo 'selenium server is starting...'
  # Seleniumサーバのプロセス番号を変数にセット
  pid=`ps -ef | grep selenium | grep -v grep | awk '{print $2}'`
  echo "process number of selenium server : ${pid}"
else
  # Seleniumサーバが起動していない場合
  echo 'selenium server is stopping...'
  # Seleniumサーバをバックエンド起動
  /usr/bin/java -jar ./selenium-server-standalone-3.9.1.jar &
  # Seleniumサーバのプロセス番号を変数にセット
  pid=%1
  echo "process number of selenium server : ${pid}"
fi

# Seleniumサーバが起動完了するまで、10秒待機
sleep 10s

# radiko再生プログラムを呼び出す
/usr/bin/php ./kicker.php

# Seleniumサーバ終了
echo "selenium server stopped"
kill $pid
