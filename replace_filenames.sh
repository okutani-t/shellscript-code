#!/bin/bash

# ここみた
# http://motw.mods.jp/shellscript/rename.html

# ワンライナー
# for f in apple* ; do ; mv $f ${f/apple/orange} ; done

if [ $# -lt 3 ]
then
	echo "変更前の文字列, 変更後の文字列, 変更したいファイル名を入力して下さい."
	exit 1
fi

# エラー処理
args=$*
extra_args="$1 $2"
## ${変数名#パターン} → 前方一致でのマッチ部分削除(最短マッチ)
files=${args#$extra_args}

# 実行
for f in $files
do
	mv $f ${f/$1/$2}
done
