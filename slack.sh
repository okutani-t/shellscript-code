#!/bin/bash

set -eu

# メッセージを一時保存する場所
MESSAGEFILE=$(mktemp -t webhooksXXXX)
# 終了時に削除
trap "rm ${MESSAGEFILE}" 0

# パイプの有無
if [ -p /dev/stdin ]; then
    # 改行コードを変換して格納
    cat - | tr '\n' '\\' | sed 's/\\/\\n/g' > ${MESSAGEFILE}
else
    echo "nothing stdin"
    exit 1
fi

# WebHookのURL
URL='WEBHOOKURLを記述'
# 送信先のチャンネル
CHANNEL=${CHANNEL:-'#okutani-dev'}
# botの名前
BOTNAME=${BOTNAME:-'okutani-bot'}
# 絵文字
EMOJI=${EMOJI:-':sushi:'}
# 見出し
HEAD=${HEAD:-"[見出し]\n"}

# メッセージをシンタックスハイライト付きで取得
MESSAGE='```'`cat ${MESSAGEFILE}`'```'

# json形式に整形
payload="payload={
    \"channel\": \"${CHANNEL}\",
    \"username\": \"${BOTNAME}\",
    \"icon_emoji\": \"${EMOJI}\",
    \"text\": \"${HEAD}${MESSAGE}\"
}"

# 送信
curl -s -S -X POST --data-urlencode "${payload}" ${URL} > /dev/null
