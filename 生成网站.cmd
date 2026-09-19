@echo off
chcp 65001 >nul
set "NODE_HOME=C:\Users\xwh\Documents\Codex\tools\node-v24.21.0-win-x64"
set "PATH=%NODE_HOME%;%PATH%"
cd /d "%~dp0"
call "%NODE_HOME%\npm.cmd" run build
if errorlevel 1 (
  echo.
  echo 生成失败，请把上方错误信息发给 Codex。
) else (
  echo.
  echo 网站已生成到 public 文件夹。
)
pause