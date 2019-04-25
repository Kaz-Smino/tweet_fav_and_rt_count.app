# README

## IERA

## Description

Get the timeline of the listed Twitter users, and display them in descending order of total value of retweets and favorites among the tweets of the last 7days.

(Persons who disseminate information mainly to beginners in programming and those who are engaged in career change to engineers are registered in the list)

## Features
ユーザーログイン機能
ユーザー登録機能
ページネーション機能

そのアプリケーションが実装している機能の一覧を簡潔に記述する)

## 3.アプリケーション内で使用している技術一覧
デプロイ Paas環境「Heroku」
DB 開発環境　Docker+MySQL 本番環境 PostgreSQL


## demo



## 必要要件 Requirements
 
## Usage

 
## Install

 
### Configuration

開発環境では`.env`ファイルを作成してください。`.env`ファイルに定義された値は環境変数として読み込まれます。
Create a `.env` file in the development environment. Values ​​defined in the `.env` file are read as environment variables.

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

# Licence
This software is released under the MIT License, see LICENSE.

# Authors
suminofu0829