<?php
namespace Facebook\WebDriver;

use Facebook\WebDriver\Remote\DesiredCapabilities;
use Facebook\WebDriver\Remote\RemoteWebDriver;

require_once('vendor/autoload.php');

$host = 'http://localhost:4444/wd/hub'; // SeleniumサーバのデフォルトURLを指定

// GoogleChromeを起動
$driver = RemoteWebDriver::create($host,DesiredCapabilities::chrome());

// radiko page access
$driver->get('http://radiko.jp/#!/live/MBS');

// radikoが読み込み完了するまで、5秒待機
$driver->wait(5);

// 「再生する」ボタンをクリックする
$link = $driver->findElement(WebDriverBy::xpath("//div[@id='now-programs-list']/div/div[2]/p[3]/a/i"));
$link->click();

// ラジオ再生中は、処理をスリープ状態にする
sleep(60 * 60 * 2);
#sleep(60 * 1);

// ブラウザを閉じる
$driver->quit();
