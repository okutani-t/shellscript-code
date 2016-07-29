# shellscript-code
シェルスクリプトのコード

## USAGE

なにはともあれ実行権限。

```
$ chmod +x hoge.sh
```

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

author: okutani
