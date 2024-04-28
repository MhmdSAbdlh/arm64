@echo off
setlocal

rem Set the path to your 7-Zip installation directory
set "sevenZipPath=C:\Program Files\7-Zip"

rem Set the path to the files you want to add to the bz2 archive
set "filesToAdd=C:\Users\hamad\Documents\GitHub\sileo\Packages"

rem Set the path to the bz2 archive
set "bz2Archive=C:\Users\hamad\Documents\GitHub\sileo\Packages.bz2"

rem Set the path to the gz archive
set "gzArchive=C:\Users\hamad\Documents\GitHub\sileo\Packages.gz"

rem Check if 7-Zip exists in the specified path
if not exist "%sevenZipPath%\7z.exe" (
    echo 7-Zip not found in specified path: %sevenZipPath%
    exit /b
)

rem Add files to the bz2 archive
"%sevenZipPath%\7z.exe" a "%bz2Archive%" "%filesToAdd%"

rem Add files to the gz archive
"%sevenZipPath%\7z.exe" a "%gzArchive%" "%filesToAdd%"

echo Files added to archive: %bz2Archive% %gzArchive%

endlocal
