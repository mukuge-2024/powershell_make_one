# ���[�U�[�t�H�[�������@- �`�F�b�N�{�b�N�X�� -

# �A�Z���u���̃��[�h
Add-Type -AssemblyName System.Windows.Forms

# �t�H�[���̍쐬
$form = New-Object System.Windows.Forms.Form
$form.Size = "250,280"
$form.Startposition = "CenterScreen"
$form.Text = "�I��"

# ���x�����쐬
$label = New-Object System.Windows.Forms.Label
$label.Location = "10,20"
$label.Size = "250,20"
$label.Text = "�D���ȉʕ���I�����Ă�������"

# �`�F�b�N�{�b�N�X���쐬
$CheckedBox = New-Object System.Windows.Forms.CheckedListBox
$CheckedBox.Location = "5,40"
$CheckedBox.Size = "220,150"

# �z����쐬
$RETU = ("���","�݂���","������","������","�o�i�i","������","������","�p�p�C��","�L���E�C","�I�����W","�Ԃǂ�")

# �`�F�b�N�{�b�N�X��10���ڂ�ǉ�
$CheckedBox.Items.AddRange($RETU)

# ���ׂĂ̊����̑I�����N���A
$CheckedBox.ClearSelected()

# OK�{�^���̐ݒ�
$OKButton = New-Object System.Windows.Forms.Button
$OKButton.Location = "40,200"
$OKButton.Size = "75,30"
$OKButton.Text = "OK"
$OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK

# �L�����Z���{�^���̐ݒ�
$CancelButton = New-Object System.Windows.Forms.Button
$CancelButton.Location = "130,200"
$CancelButton.Size = "75,30"
$CancelButton.Text = "Cancel"
$CancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel

# �t�H�[���ɃA�C�e����ǉ�
$form.Controls.Add($label)
$form.Controls.Add($OKButton)
$form.Controls.Add($CancelButton)
$form.Controls.Add($CheckedBox)

# �L�[�ƃ{�^���̊֌W
$form.AcceptButton = $OKButton
$form.CancelButton = $CancelButton

# �őO�ʂɕ\���F����
$form.Topmost = $True

# �t�H�[����\��
$result = $Form.ShowDialog()

# ��������
if ( $result -eq "OK" )
{
    $AAA = @($CheckedBox.CheckedItems)
}else{
    exit
}