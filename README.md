# shellscript-code
シェルスクリプトのコード

## USAGE

なにはともあれ実行権限。

```
$ chmod +x hoge.sh
```

## 作ったシェルスクリプトの説明

作ったやつは以下。

### findgrep

findとgrepで検索してくれるやつ。

$ ./findgrep.sh 検索文字 パス ファイル名

```
$ ./findgrep.sh hoge
$ ./findgrep.sh hoge /to/path/
$ ./findgrep.sh hoge /to/path/ test.text
```

### replace_filenames

現在位置にあるすべてのファイル名を置換するやつ。

$ ./replace_filenames.sh 変更前の文字列 変更後の文字列 ファイル名

```
$ ./replace_filenames.sh JPG jpg hoge*
```

こいつなくてもワンライナーでいける。例はappleをorangeにしてる。

```
$ for f in apple* ; do ; mv $f ${f/apple/orange} ; done
```

### zip_backup

特定のディレクトリをバックアップしてくれるやつ。中身見てパスとか書き換える。

```
$ ./zip_backup.sh
```

### pg_backup

PostgreSQLのDBをバックアップするやつ。中身見て書き換える。

```
$ ./pg_backup.sh
```

### slack.sh

slackに通知を送るスクリプト。URLあたりを適宜書き換える。

```
$ echo test1 | ./slack.sh
$ ls | ./slack.sh
$ w | ./slack.sh
```

一般的な使い方は、他のシェルから呼んであげる

```
echo "slackに送信"
echo "◯◯の処理が正常に完了したよ" | ./slack.sh
echo "slackに送信完了！"
```

## Author

[okutani](http://okutani.net)
