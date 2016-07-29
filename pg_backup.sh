#!/bin/bash

# バックアップファイルを残しておく日数
PERIOD='+10'

# 日付
DATE=`date '+%Y%m%d-%H%M%S'`

# バックアップ先ディレクトリ
SAVEPATH='/var/backup/pg/'

# 先頭文字
PREFIX='dbname-'

# 拡張子
EXT='.sql'

# データーベース名
DBNAME='dbname'

# バックアップ実行
pg_dump $DBNAME > $SAVEPATH$PREFIX$DATE$EXT

# 保存期間が過ぎたファイルの削除
find $SAVEPATH -type f -daystart -mtime $PERIOD -exec rm {} \;
