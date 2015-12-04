書籍管理（仮）
===========

研究室を想定した書籍管理システムです。

## 動作環境

 - ruby 2.2.1
 - Rails 4.2.4
 - MySQL( **SQLite不可** )

## セットアップ

```
git clone https://github.com/thr3a/karibook.git
cd karibook
bundle install
```

**config/database.yml** にてデータベースの設定を行います。

このアプリケーションはAmazonのAPIを利用します

```
export SECRET_KEY_BASE=******
export ASSOCIATE_TAG=******
export AWS_ACCESS_KEY=******
export AWS_SECRET_KEY=******
```
