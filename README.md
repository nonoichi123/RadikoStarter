# RadikoStarter
Radikoでラジオを自動再生するプログラム

SeleniumServerとiCalを利用し、Radikoを目覚ましアラームとして機能させる

##　実行環境

macOS　High　Sierra　10.13.3
php 7.1.7
Selenium Server Standalone 3.9.1
GoogleChrome 63.0

##　利用するツール

GoogleChrome
Terminal
iCal
Automator

##　セットアップ手順

### ソース取得と初期設定

1. 適当な場所で、ソースをcloneする

※　初期状態は、/Users/[ユーザ名]/Documents/Develop/RadikoStarter　配下に実行ファイルを設置する

2. radikoStarter.sh ７行目を編集
→　ソースの設置ディレクトリのパスに変更

3. kicker.php　１５行目を編集
→　自動再生させたいラジオ局のURLに変更
※　初期状態は、MBSになっている

4. kicker.php　2５行目を編集
→　再生時間を変更
※　初期状態は、２時間経過後に再生が終了するようになっている

### ライブラリインストール

1. Terminalを起動

Composer がインストールされていない方は、以下のコマンドを実行して、Composerインストール作業を初めに行うこと

```
curl -sS https://getcomposer.org/installer | php
```

2. ライブラリをインストール

```
composer.phar install
```

###　動作確認

1. Terminalで、ソースの設置ディレクトリに移動後、以下コマンドを実行する

```
sh radikoStarter.sh
```

2. GoogleChromeが自動起動され、自動再生が始まることを確認する

###　タイマー起動設定

