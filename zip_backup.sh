#!/bin/bash

# バックアップファイルを残しておく日数
PERIOD='+10'

# 日付
DATE=`date +%Y%m%d%H%M%S`

# バックアップ先ディレクトリ
SAVEPATH='/var/backup/zip/'

#バックアップ元フォルダ
PROJDIR='/var/www/'

# 先頭文字
PREFIX='prog_name-'

# バックアップファイル名
DIRNAME='proj_name'

#ファイル名設定
FILENAME="$PREFIX$DATE.zip"

# バックアップファイルまでcd
cd $PROJDIR

#バックアップの実行
zip -r $SAVEPATH/$FILENAME $DIRNAME -x $DIRNAME/vendor\* $DIRNAME/.git\*

# パーミッション変更
chmod 700 $SAVEPATH/$FILENAME

# 古いバックアップファイルを削除
find $SAVEPATH -type f -daystart -mtime $PERIOD -exec rm {} \;
