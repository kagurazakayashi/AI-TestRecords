@echo off
setlocal enabledelayedexpansion

for %%i in (*.cs) do (
    ECHO Compiling %%i ...
    dotnet new console --name %%~ni --output %%~ni --force --no-update-check --language C# --use-program-main
    DEL %%~ni\Program.cs
    COPY %%i %%~ni\Program.cs
    CD %%~ni
    @REM dotnet build --no-restore --no-incremental --configuration Release --nologo
    dotnet run --no-restore --no-incremental --configuration Release
    CD ..
    RD /S /Q %%~ni
    ECHO Done %%i .
    ECHO ========================
)

endlocal
