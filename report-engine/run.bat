@echo off
rem Start ReportFactory Lite as a standalone service (embedded Tomcat).
rem
rem Usage:  run.bat [ROOT] [extra Spring args...]
rem
rem ROOT is the report-engine folder containing config\, templates\, reports\, logs\
rem and an optional lib\ folder for extra jars (QR/barcode, custom fonts, JasperReports
rem extensions) - the standalone equivalent of Tomcat's lib\ folder.
rem If ROOT is omitted it defaults to the folder this script lives in (self-contained bundle).
setlocal enabledelayedexpansion

set "SCRIPT_DIR=%~dp0"

set "ROOT=%~1"
if not "%~1"=="" shift
if "%ROOT%"=="" set "ROOT=%RFL_ROOT%"
rem Default to the script's folder; strip the trailing backslash from %~dp0.
if "%ROOT%"=="" set "ROOT=%SCRIPT_DIR:~0,-1%"

set "WAR="
for %%f in ("%SCRIPT_DIR%report-factory-lite*.jar") do set "WAR=%%f"
if not defined WAR for %%f in ("%SCRIPT_DIR%target\report-factory-lite*.jar") do set "WAR=%%f"
if not defined WAR (
  echo ERROR: could not find report-factory-lite*.jar
  exit /b 1
)

if not exist "%ROOT%\lib" mkdir "%ROOT%\lib"
if not exist "%ROOT%\reports" mkdir "%ROOT%\reports"
if not exist "%ROOT%\logs" mkdir "%ROOT%\logs"

echo Starting ReportFactory Lite
echo   archive  : %WAR%
echo   root     : %ROOT%
echo   config   : %ROOT%\config\
echo   ext libs : %ROOT%\lib\  (drop extra jars here)

rem Supervisor loop: relaunch when the console requests a restart (exit code 86).
:run
java %JAVA_OPTS% -Dloader.path="%ROOT%\lib" -jar "%WAR%" --spring.config.additional-location="file:%ROOT%/config/" --maathra.rfl.root="%ROOT%" %*
if %ERRORLEVEL%==86 (
  echo ReportFactory Lite requested a restart - relaunching...
  goto run
)
endlocal
