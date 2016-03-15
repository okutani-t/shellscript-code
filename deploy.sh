#!/bin/bash

#############ここから#############

# デプロイしたいディレクトリの場所
deploy_path=./www/

# デプロイするプロジェクトのディレクトリ名
proj_name=dir_name

# リモートリポジトリのURLパス
remote_path=https://github.com/okutani-t/proj.git

# デプロイするブランチ
branch=master

# 本番環境へのSSHログイン情報（ユーザ名@ホスト名）
usr_at_host=user@host

#############ここまで#############

ssh -A ${usr_at_host} "
    # Gitがあるか確認
    if ! type 'git' > /dev/null 2>&1; then
        echo 'git not found...'
        exit 1
    fi

    # デプロイ場所が無かったら作成
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
        # 競合を起こさないよう、強制的にリモートリポジトリに合わせる
        git fetch origin
        git reset --hard origin/${branch}
        # git pull origin ${branch}
        echo 'deployment success!'
    fi
"
