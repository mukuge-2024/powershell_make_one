# テキストファイルのパス
$textFilePath = "C:\Users\kuma\Desktop\20240615_adm\adm_data.txt"

# Excelオブジェクトを作成
$excel = New-Object -ComObject Excel.Application

# Excelウィンドウを表示しない設定
$excel.Visible = $false

# 新しいブックを作成
$workbook = $excel.Workbooks.Add()

# シートを取得
$sheet = $workbook.Worksheets.Item(1)

# テキストファイルからデータを読み込む
$data = Get-Content -Path $textFilePath

# データをシートに書き込む
for ($i = 0; $i -lt $data.Length; $i++) {
    $sheet.Cells.Item($i + 1, 1) = $data[$i]
}

# Excelファイルを保存
$outputPath = "C:\Users\kuma\Desktop\20240615_adm\output.xlsx"
$workbook.SaveAs($outputPath)

# Excelを終了
$excel.Quit()

Write-Host "Excelファイルを作成しました。"