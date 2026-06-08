@echo off
echo Avvio 5 istanze PylaAi-XXZ...

start "LDPlayer #0" python main.py --instance instance0
timeout /t 2 /nobreak >nul

start "LDPlayer #1" python main.py --instance instance1
timeout /t 2 /nobreak >nul

start "LDPlayer #3" python main.py --instance instance3
timeout /t 2 /nobreak >nul

start "LDPlayer #4" python main.py --instance instance4
timeout /t 2 /nobreak >nul

start "LDPlayer #5" python main.py --instance instance5

echo Tutte le istanze avviate.
