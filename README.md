# shellscript-code
シェルスクリプトのコード

## deploy.sh

win, linuxはssh-agentを立ち上げておく(.bashrcなどに以下記述)

```
eval `ssh-agent`  > /dev/null 2>&1
ssh-add ~/.ssh/id_rsa  > /dev/null 2>&1
```

author: okutani
