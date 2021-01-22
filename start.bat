@echo off
start /b /d server garlic.exe
start /b /d site caddy_windows_amd64_custom.exe file-server
start "" "http://localhost"
