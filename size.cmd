@echo off
setlocal

rem Get the file path passed as an argument
set "FilePath=%~1"

rem Check if a file path is provided
if "%FilePath%"=="" (
    echo No file selected.
    exit /b
)

rem Check if the file exists
if not exist "%FilePath%" (
    echo File does not exist: %FilePath%
    exit /b
)

rem Get file name without extension
for %%F in ("%FilePath%") do set "FileName=%%~nF"

rem Get file extension
for %%F in ("%FilePath%") do set "FileExt=%%~xF"

rem Get file size
for %%F in ("%FilePath%") do set "FileSize=%%~zF"

rem Create output file
set "OutputFile=%FileName%_hash_report.txt"

rem Get hash values
for /f "delims=" %%i in ('certutil -hashfile "%FilePath%" MD5 ^| findstr /v "CertUtil"') do set "MD5=%%i"
for /f "delims=" %%i in ('certutil -hashfile "%FilePath%" SHA1 ^| findstr /v "CertUtil"') do set "SHA1=%%i"
for /f "delims=" %%i in ('certutil -hashfile "%FilePath%" SHA256 ^| findstr /v "CertUtil"') do set "SHA256=%%i"
for /f "delims=" %%i in ('certutil -hashfile "%FilePath%" SHA512 ^| findstr /v "CertUtil"') do set "SHA512=%%i"

rem Write to output file with values on separate lines
(
    echo MD5: %MD5%
    echo SHA1: %SHA1%
    echo SHA256: %SHA256%
    echo SHA512: %SHA512%
    echo SIZE: %FileSize% bytes
) > "%OutputFile%"

echo Hash values and file size have been saved to "%OutputFile%".
