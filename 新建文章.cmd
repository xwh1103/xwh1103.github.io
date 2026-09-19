@echo off
chcp 65001 >nul
set "NODE_HOME=C:\Users\xwh\Documents\Codex\tools\node-v24.21.0-win-x64"
set "PATH=%NODE_HOME%;%PATH%"
cd /d "%~dp0"
set /p "POST_TITLE=请输入文章标题："
if "%POST_TITLE%"=="" (
  echo 文章标题不能为空。
  pause
  exit /b 1
)
call "%NODE_HOME%\npx.cmd" hexo new "%POST_TITLE%"
echo.
echo 文章已创建，请到 source\_posts 文件夹中编辑。
pause