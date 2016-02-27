#!/bin/bash

usage()
{
    # シェルスクリプトのファイル名を取得
    local script_name=$(basename "$0")

    # ヒアドキュメントの作成
    cat << EOF
Usage: $script_name PATTERN [PATH] [NAME_PATTERN]
Find file in current directory recursively, and print lines which match PATTERN.

  PATH         find file in PATH directory, instead of current directory
  NAME_PATTERN specify name pattern to find file

Examples:
  $script_name return
  $script_name return ~ '*.txt'
EOF
}

# コマンドライン引数が0個
if [ "$#" -eq 0 ]; then
    usage
    exit 1
fi
pattern=$1
directory=$2
name=$3

# 第二引数が空ならカレントディレクトリを利用
if [ -z "$directory" ]; then
    directory='.'
fi

# 第三引数が空なら'*'を利用
if [ -z "$name" ]; then
    name='*'
fi

# 検索ディレクトリが存在しない場合はエラー
if [ ! -d "$directory" ]; then
    echo "$0: ${directory}: No such directory" 1>&2
    exit 2
fi

find "$directory" -type f -name "$name" | xargs grep -nH "$pattern"
