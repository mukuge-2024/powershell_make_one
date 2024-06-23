# 変数宣言
[string[][]]$columns = @()
[string[]]$column = @()

# file1.txtの内容を$columnに要素を追加して代入
$column += "a1"
$column += "a2"
$column += "a3"
$column += "a4"

# $columnを配列として$columnsを代入
$columns += ,@($column)

# $columnを空にする
[string[]]$column = @()

$column += "b1"
$column += "b2"
$column += "b3"
$column += "b4"

# 再度$columnを配列として$columnsを代入
$columns += ,@($column)

# 以降ファイル数分を繰り返す。

Write-Host ($columns[0][0] + "," + $columns[1][0])
Write-Host ($columns[0][1] + "," + $columns[1][1])
Write-Host ($columns[0][2] + "," + $columns[1][2])
Write-Host ($columns[0][3] + "," + $columns[1][3])