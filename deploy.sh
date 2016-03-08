#!/bin/bash

#############ここから#############

### util ###
# デプロイしたいディレクトリの場所
deploy_path='./www/'
# デプロイするプロジェクトのディレクトリ名
proj_name='go-code'
# リモートリポジトリのURLパス
remote_path='https://github.com/okutani-t/go-code.git'
# デプロイする
branch='master'

### ssh ###
# 本番環境のユーザー名
user='hoge'
# 本番環境のホスト名
host='piyo.sakura.ne.jp'

#############ここまで#############

ssh ${user}@${host} "
    # デプロイ場所があるか確認
    if [ ! -e ${deploy_path} ]; then
        mkdir -p ${deploy_path}
    fi
    cd ${deploy_path}
    # プロジェクトのディレクトリがあるか確認
    # なければclone、あればpullをおこなう
    if [ ! -e ${proj_name} ]; then
        git clone ${remote_path} ${proj_name}
    else
        cd ${proj_name}
        git pull origin ${branch}
    fi
"
