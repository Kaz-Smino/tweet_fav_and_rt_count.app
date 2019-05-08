 ## IERA(イエラ)

 

- URL: [http://iera.suminofu.com/](http://iera.suminofu.com/)
- テストユーザーログイン情報: Email: test1@yahoo.co.jp, Password: 111111

 ## コンセプト
プログラミング初学者・Web業界への転職活動中の方々へ向けて情報発信するサービスです。

 ## 概要
Twitterユーザーさん(主に現役エンジニアの方々)をまとめたリストのタイムラインを取得し、直近1週間のtweetの中から、リツイートとお気に入りの合計値が多い順に表示します。

 ## 機能一覧
- ユーザー登録機能
- ユーザー認証機能
- ページネーション機能

 ## 使用している技術一覧
- フロントエンド: HTML/CSS, Bootstrap, jQuery
- バックエンド(フレームワーク): Ruby on Rails
- DB: 開発環境[MySQL+Docker]、本番環境[PostgreSQL]
- デプロイ:Heroku
- リポジトリ管理: Github
- WebAPI: Twitter API

## 設定(Docker+MySQL)

開発環境では`.env`ファイルを作成してください。`.env`ファイルに定義された値は環境変数として読み込まれます。
```
$ cp .env_sample .env
```
DockerでMySQLを起動することができます。デフォルトは43006ポートで起動します。
```
$ ./bin/create_db
```
すでにコンテナがある場合は`-f`オプションで強制的に作成することができます。
```
$ ./bin/create_db -f
```

## 設定(Heroku Scheduler)
Heroku Scheduler([https://devcenter.heroku.com/articles/scheduler](https://devcenter.heroku.com/articles/scheduler))で
10分毎にRakeタスク([mysql.rake](https://github.com/suminofu0829/tweet_fav_and_rt_count.app/blob/master/lib/tasks/mysql.rake "mysql.rake"))をバッチ処理するように設定して下さい。

DBに新たなtweetを追加する
```
$ ./bin/rake mysql:add_data
```
DB登録済のtweetの情報(お気に入り・RTの合計数等)を更新する
```
$ ./bin/rake mysql:update_data
```


## ライセンス

このソフトウェアはMITライセンスの下でリリースされています。LICENSEを参照して下さい。

  

## 作者

suminofu0829