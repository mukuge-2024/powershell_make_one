# findfiles.ps1
# 説明：特定の文字列を含んだファイルを一覧表示する方法

Param(
    $arg # 引数
)
try {
    $ErrorActionPreference = "Stop"
    $count = 0
    
    $files = Get-ChildItem -Path C:\Users\kuma\Desktop\20240615_adm -Exclude *.ps1
    
    # $files = Get-ChildItem -Path "C:\Users\kuma\Desktop\20240615_adm" -Recurse -File
    # -Recurseフラグは、サブディレクトリ内のファイルも含めて再帰的に検索することを指示
    # -Fileフラグは、ファイルのみを取得することを示す
    
    $totals = ($files | Measure-Object).Count
    # Measure-Objectコマンドレットは、渡されたオブジェクトのプロパティを測定し、統計情報を提供します。.Countは測定されたオブジェクトの数を返します。
    
    $files | ForEach-Object {
        $count += 1
        $per = ($count/$totals)*100
        $rtime = $totals - $count 
        Write-Progress -Activity "Progress: " -Status "$per% Complete" -PercentComplete $per -secondsRemaining $rtime
        # -Activityフラグは進行状況ウィンドウに表示されるアクティビティ名を指定し、
        # -Statusフラグは進行率のステータスを示します。
        # -PercentCompleteフラグは進行率をパーセンテージで指定し、
        # -secondsRemainingフラグは残りの秒数を指定します。
        
        if (Get-Content $_.FullName | Select-String -Pattern "$arg" -Quiet) {
            # Get-Contentコマンドレットは、ファイルの内容を取得します。$_は現在のファイルオブジェクトを表し、FullNameプロパティはファイルのフルパスを返します。
            # Select-Stringコマンドレットは、指定されたパターンに一致する行を選択します。-Patternフラグは検索するパターンを指定し、
            # -Quietフラグは一致が見つかった場合に真を返します。
            
            Write-Host "ファイル名: $($_.FullName)"
            # $($_.FullName)は、現在のファイルのフルパスを表します。
        } 
    }
} catch {
    Write-Host $_ -ForegroundColor "Red" # catch内の例外情報は、「$_」変数でアクセスできる。
} finally {}