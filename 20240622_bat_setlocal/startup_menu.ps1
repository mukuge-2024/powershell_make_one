using namespace System.Windows.Forms
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# フォーム情報
#region designer

    # カレントディレクトリ
    $scriptPath = Get-Location

    # フォントの設定
    $Font = New-Object System.Drawing.Font("メイリオ",8)

    # フォーム
    $form = New-Object Form
    $form.Text = "バッチ一覧($scriptPath)"
    $form.MaximizeBox = $false
    $form.MinimizeBox = $false
    $form.StartPosition = "CenterScreen"
    $form.Size = "565, 150"
    $form.font = $Font

    # チェックボックス
    $CheckedBox = New-Object CheckBox
    $CheckedBox.Text = "管理者権限で実行"
	$CheckedBox.Size = "200,22" 
    $CheckedBox.Location = "5, 5"
    $CheckedBox.Checked = $True
    $CheckedBox.font = $Font
    $form.Controls.Add($CheckedBox)

    function Form_Load
    {
        $LocationX = 25
        $LocationY = 30
        $i = 1        

        # サブフォルダ含まない
        #$itemList = Get-ChildItem $dir
        # サブフォルダ含む
        $itemList = Get-ChildItem $dir -Recurse
        foreach($item in $itemList)
        {
            #bat,cmdファイルのみ
            if($item.Extension -eq ".bat" -or $item.Extension -eq ".cmd")
            {
                #除外するファイル
                if($item.Name -eq "")
                {
                    continue
                }

                $btn = New-Object Button
                $btn.font = $Font
                #ボタン名は置換可能
                $btn.Text =  [regex]::Replace($item.BaseName, "", "")
                $btn.Tag = $item.FullName
                $btn.Size = "150, 50"
                $btn.Location = "$LocationX,$LocationY"

                #3個ボタンを設置したら次の行へ
                if($i % 3 -eq 0)
                {
                    $LocationX = 25
                    $LocationY += $btn.height + 25
                    $form.Height += $btn.height + 25
                } else 
                {
                    $LocationX += $btn.Width + 25
                }
                $btn.Add_Click({
                     # 管理者権限で実行
                     If($CheckedBox.Checked)
                     {
                        Start-Process -FilePath $this.Tag -Verb runas
                     }
                     else
                     {
                        Start-Process -FilePath $this.Tag
                     }

                })
                $form.Controls.Add($btn)
                $i += 1
            }
        }
        $form.MaximumSize = $form.Size
        $form.MinimumSize = $form.Size
    }
#endregion

# スタートアップ処理
#region startup
    Form_Load
    $form.ShowDialog()
#endregion
