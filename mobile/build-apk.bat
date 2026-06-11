@echo off
REM 全球兽药注册助手 - 云编译脚本 (Windows)
REM 这个脚本会自动为您生成 APK

echo.
echo ==========================================
echo 全球兽药注册助手 - 云编译开始
echo ==========================================
echo.

REM 检查是否安装了 Node.js
where node >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ❌ 错误：未找到 Node.js
    echo 请访问 https://nodejs.org/ 安装 Node.js
    pause
    exit /b 1
)

for /f "tokens=*" %%i in ('node --version') do set NODE_VERSION=%%i
echo ✅ 已检测到 Node.js: %NODE_VERSION%
echo.

REM 进入 mobile 目录
cd /d "%~dp0"

REM 安装依赖
echo 📦 安装依赖中...
call npm install
if %ERRORLEVEL% NEQ 0 (
    echo ❌ 依赖安装失败
    pause
    exit /b 1
)

echo ✅ 依赖安装完成
echo.

REM 安装 EAS CLI
echo ⬇️  安装 EAS CLI...
call npm install -g eas-cli
if %ERRORLEVEL% NEQ 0 (
    echo ❌ EAS CLI 安装失败
    pause
    exit /b 1
)

echo ✅ EAS CLI 安装完成
echo.

REM 登录 Expo
echo 🔐 请登录 Expo 账户...
echo 如果您没有账户，系统会提示您创建一个（免费）
echo.
call eas login

if %ERRORLEVEL% NEQ 0 (
    echo ❌ 登录失败
    pause
    exit /b 1
)

echo.
echo ✅ 登录成功
echo.

REM 开始编译
echo 🔨 开始编译 APK（这可能需要 10-15 分钟）...
echo 请耐心等待...
echo.

call eas build --platform android --local

if %ERRORLEVEL% NEQ 0 (
    echo ❌ 编译失败
    echo 请检查错误信息并重试
    pause
    exit /b 1
)

echo.
echo ==========================================
echo ✅ APK 编译完成！
echo ==========================================
echo.
echo 📱 APK 已保存到您的 Expo 账户
echo 请访问: https://expo.dev/dashboard
echo 查看最新的编译结果并下载 APK
echo.
echo 或者在上面的输出中查找下载链接
echo.
pause
