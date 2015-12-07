書籍管理（仮）
===========

研究室などの小規模施設を想定した書籍管理システムです。

# 機能

- SlackのOAuth認証を用いた管理システム
- AmazonAPIを用いたスムーズな書籍登録

## 必要なもの

 - ruby 2.2.1
 - Rails 4.2.4
 - MySQL( **SQLite不可** )
 - AWSのアクセスキーとAmazonアフィリエイトタグ
 - Slackのアカウント

## セットアップ

```
git clone https://github.com/thr3a/karibook.git
cd karibook
bundle install
```

**config/database.yml** にてデータベースの設定を行います。
デフォルトではデータベース名が`karibook`になっています。

```
default: &default
  adapter: mysql2
  database: karibook
  host: localhost
  username: root
  password: pass
  encoding: utf8
```

環境変数の設定を行います。ターミナル上で以下を実行してください。

```
export SECRET_KEY_BASE=ターミナル上で`rake secret`を実行し出力された文字列
export ASSOCIATE_TAG=アマゾンアフィリエイトタグ
export AWS_ACCESS_KEY=AWSのアクセスキー rootのみ
export AWS_SECRET_KEY=AWSのシークレットキー rootのみ
export SLACK_TEAM=利用するSlackアカウントのチーム名 hogehoge.slack.comの場合は「hogehoge」
```

# 実行

以下はproductionモードとして実行するものとします。

データベースのマイグレーションを行います。

```
rake db:migrate RAILS_ENV=production
```

静的ファイルをプリコンパイルします。

```
rake assets:clean RAILS_ENV=production
rake assets:precompile RAILS_ENV=production
```

サーバーとして実行します。ポート番号とBindIPは適宜設定してください。

```
RAILS_SERVE_STATIC_FILES=true rails s -p $PORT -b $IP -e production
```
