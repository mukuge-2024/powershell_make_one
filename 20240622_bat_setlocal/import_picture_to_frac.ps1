#作業ディレクトリ以下にあるファイル一覧を格納
$FILE = Get-ChildItem -include *.flac -Recurse
#metaflac.exeの絶対パス指定
$PATHTOMETAFLAC = "E:\tools\flacdrop\metaflac.exe"


#flacファイルが一つもないときのメッセージ
if ( ${FILE}.count -eq 0 )
  {
  Write-host "There was no flac file."
  Read-Host  "Please press the enter key..."
  exit
  }

Write-host "Importing picture to flacs..."
foreach ( $l in ${FILE} )
  {
  
  #flacファイルの同ディレクトリにあるcover.*ファイルの名前をフルパスで格納
  $MYCOVER = ( Get-ChildItem ( ${l}.DirectoryName + "\*.*" ) -include cover.* ).FullName
  
  #cover.*ファイルが一つのみなら処理開始
  if ( ${MYCOVER}.Count -eq 1 )
    {
    #metaflac.exeに引き渡す引数とオプション指定。冒頭のスペース忘れずに
    $MYMETAFLACARGS = " --import-picture-from=`"||||${MYCOVER}`" `"${l}`""
    #metaflacのコマンドと引数/オプションを結合
    $MYCMD = ${PATHTOMETAFLAC} + ${MYMETAFLACARGS}
    #metaflacを利用して画像を埋め込む
    Invoke-Expression ${MYCMD}

    #正常性確認
    if ( $LASTEXITCODE -eq 0)
      {
      Write-host "[INFO] : Done. ${l}"
      } else {
      Write-host "[ERROR] : Unknown failure to import picture. ${l}"
      }

    #cover.*ファイルがない場合
    } elseif ( ${MYCOVER}.Count -eq 0 ) {
    Write-host "[ERROR] : cover.* was not found in the same directory. ${l}"

    #cover.*ファイルが複数ある場合
    } else {
    Write-host "[ERROR] : Multiple cover.* in the same directory. Please place only one cover.*. ${l}"
    }
  
  }

Read-Host "Please press the enter key..."