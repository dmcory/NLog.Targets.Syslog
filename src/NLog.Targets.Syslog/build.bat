@echo off
echo Building package...
rmdir /S /Q deploy
msbuild NLog.Targets.Syslog.csproj /t:Build /p:Configuration=Release /property:Platform=AnyCPU /v:minimal /nologo
..\..\tools\NuGet.exe pack NLog.Targets.Syslog.csproj -Prop Configuration=Release -Prop Platform=AnyCPU
mkdir deploy
for /f %%a in ('dir /b /s .\*.nupkg') do call move /Y %%a deploy