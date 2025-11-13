@echo off
REM Tapline - Husky Setup Script (Windows)
REM This script sets up Husky git hooks for the project

echo.
echo ========================================
echo   Tapline - Husky Setup
echo ========================================
echo.

REM Check if we're in the right directory
if not exist "package.json" (
  echo [ERROR] package.json not found. Please run this script from the project root.
  pause
  exit /b 1
)

REM Check if Node.js is installed
where node >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
  echo [ERROR] Node.js is not installed. Please install Node.js 20+ first.
  echo Download from: https://nodejs.org/
  pause
  exit /b 1
)

REM Check if pnpm is installed
where pnpm >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
  echo [ERROR] pnpm is not installed.
  echo Install it with: npm install -g pnpm
  pause
  exit /b 1
)

echo [OK] Node.js and pnpm are installed
echo.

REM Install dependencies
echo [STEP 1/3] Installing dependencies...
call pnpm install
if %ERRORLEVEL% NEQ 0 (
  echo [ERROR] Failed to install dependencies
  pause
  exit /b 1
)
echo [OK] Dependencies installed
echo.

REM Initialize Husky
echo [STEP 2/3] Initializing Husky...
call pnpm run prepare
if %ERRORLEVEL% NEQ 0 (
  echo [ERROR] Failed to initialize Husky
  pause
  exit /b 1
)
echo [OK] Husky initialized
echo.

REM Verify Husky files
echo [STEP 3/3] Verifying Husky files...
if not exist ".husky\_\husky.sh" (
  echo [WARNING] .husky\_\husky.sh not found
  echo This might cause issues. Try running: pnpm run prepare
)

if not exist ".husky\commit-msg" (
  echo [WARNING] .husky\commit-msg not found
)

if not exist ".husky\pre-commit" (
  echo [WARNING] .husky\pre-commit not found
)

echo [OK] Husky files verified
echo.

REM Success message
echo ========================================
echo   Setup Complete!
echo ========================================
echo.
echo [SUCCESS] Husky is now configured!
echo.
echo Next steps:
echo   1. Review docs\HUSKY_SETUP.md for usage guide
echo   2. Try a valid commit:
echo      git commit -m "feat(setup): complete husky configuration"
echo   3. Check .husky\ directory for hook files
echo.
echo Commit message format:
echo   ^<type^>(^<scope^>): ^<subject^>
echo.
echo   Example: feat(mail): add email composition UI
echo.
echo Available types:
echo   feat, fix, docs, style, refactor, test, chore, ci, build
echo.
echo Available scopes:
echo   gateway, mail, chat, meet, calendar, ai, auth, frontend, etc.
echo.

pause
