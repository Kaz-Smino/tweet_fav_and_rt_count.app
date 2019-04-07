# README(作成中 )

## 1.アプリケーションの概要(基本的には１行で完結させる)

## 2.アプリケーションの機能一覧
(記事投稿機能、記事にコメントをつける機能、認証機能、ページネーション機能、など、
そのアプリケーションが実装している機能の一覧を簡潔に記述する)

## 3.アプリケーション内で使用している技術一覧
(インフラには何を使っているのか(Herokuのようなpaasを使っているのか)、DBには何を使っているのか、セッション管理はどのように行なっているのか、画像アップロードはどういったライブラリを使っているのか、デプロイはどのように行なっているのか)
など、ポートフォリオの中で使った主要な技術をここに記述します。

2、３は別々に書かずに一緒に書くのがおすすめ。


＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
# リポジトリ名
このソフトはどんなもので、何ができるのかを書く
合わせて、簡単なデモ（使用例）などスクリーンショットやGIFアニメで表示

# Dependency
使用言語とバージョン、必要なライブラリとそのバージョンを書く
Pythonならrequirements.txtを用意するのも良い

# Setup
セットアップ方法を書く。用意するハードウェアとソフトウェアをセットアップするためのコマンドを記載する





### Configuration
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



# Usage
使い方。なるべく具体的に書く。サンプルも書く

# Licence
This software is released under the MIT License, see LICENSE.

# Authors
作者を明示する。特に、他者が作成したコードを利用する場合は、そのコードのライセンスに従った上で、リポジトリのそれぞれのコードのオリジナルの作者が誰か分かるように明示する（私はそれが良いと思い自主的にしています）。

# References
参考にした情報源（サイト・論文）などの情報、リンク

＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

