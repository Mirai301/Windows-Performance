Write-Output " ____   ___ ____  _____  ___  ____  ___ ___  ____ ____     __   ___    ____   _____"
Write-Output "|    \ /  _|    \|     |/   \|    \|   |   |/    |    \   /  ] /  _]  |    \ / ___/"
Write-Output "|  o  /  [_|  D  |   __|     |  D  | _   _ |  o  |  _  | /  / /  [_   |  o  (   \_ "
Write-Output "|   _|    _|    /|  |_ |  O  |    /|  \_/  |     |  |  |/  / |    _]  |   _/ \__  |"
Write-Output "|  | |   [_|    \|   _]|     |    \|   |   |  _  |  |  /   \_|   [_ __|  |   /  \ |"
Write-Output "|  | |     |  .  |  |  |     |  .  |   |   |  |  |  |  \     |     |  |  |   \    |"
Write-Output "|__| |_____|__|\_|__|   \___/|__|\_|___|___|__|__|__|__|\____|_____|__|__|    \___|`n"

Write-Output "[*] レジストリの編集を開始します｡`n"

# エフェクトの無効化
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d 3 /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "UserPreferencesMask" /t REG_BINARY /d 9012038010000000 /f

# アニメーションの無効化
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "DragFullWindows" /t REG_SZ /d 0 /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d 0 /f

# 半透明の選択ツール無効化
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect" /t REG_DWORD /d 0 /f

# デスクトップのアイコン名に影をつける無効化
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewShadow" /t REG_DWORD /d 0 /f

# タスクバーとスタートメニューでアニメーションを表示する無効化
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t REG_DWORD /d 0 /f

# Aeroプレビューを無効化
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\DWM" /v "EnableAeroPeek" /t REG_DWORD /d 0 /f

# タスクバーの縮小版のプレビューを保存する無効化
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\DWM" /v "AlwaysHibernateThumbnails" /t REG_DWORD /d 0 /f

# バックグラウンドアプリケーションの無効化
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "BackgroundAppGlobalToggle" /t REG_DWORD /d 0 /f

# ヒントの無効化
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d 0 /f

# コルタナ無効化
reg add "HKEY_CURRENT_USER\Software\Microsoft\Speech_OneCore\Settings\VoiceActivation\UserPreferenceForAllApps" /v "AgentActivationEnabled" /t REG_DWORD /d 0 /f

# Xboxの無効化
reg add "HKEY_CURRENT_USER\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "VideoEncodingFrameRateMode" /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "HistoricalCaptureEnabled" /t REG_DWORD /d 0 /f

Write-Output "[*]電源オプションを高パフォーマンスに設定します｡`n"
# 電源オプションを高パフォーマンスに設定
powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
# 電源オプションの取得
powercfg.exe /GETACTIVESCHEME

Write-Output "`n[*]HDDのデフラグを開始します｡`n"
# HDDのデフラグ
defrag /A /C /U /V

# 再起動の確認
[string]$anser = Read-Host "再起動しますか？(yes/no)：" 

If ($anser.Contains("y")) {
    Write-Host "再起動します"
    # 再起動
    taskkill /f /im explorer.exe
    start explorer.exe
    shutdown /r /t 0
}Else{
    Write-Host "再起動せず処理を終了します"
    exit(0)
}