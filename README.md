Windowsのパフォーマンス優先設定を行うPowerShellスクリプトです｡  
スクリプトを起動する前にWindowsバックアップ/RegistryChanges View等でレジストリのバックアップを取ることをおすすめします｡  
スクリプト最終行にてWindowsの再起動を行うため､使用には注意して下さい｡  
  
## 使用方法  
![image](https://user-images.githubusercontent.com/53959334/163707940-9c3b46d5-a33e-429f-9e4a-40534968f785.png)
cd <--Performance.ps1をダウンロードしたディレクトリのPath(例：C:\users\〇〇\Downloads等)-->  
powershell -ep bypass  
.\Performance.ps1
