rmdir /s /q %userprofile%\.vscode
rmdir /s /q %userprofile%\vscode-remote-wsl
rmdir /s /q %appdata%\Code
for /f %%i in (%~dp0extensions-list.txt) do cmd /c code --install-extension %%i
copy %~dp0settings.json %appdata%\Code\User\
copy %~dp0keybindings.json %appdata%\Code\User\
echo done
