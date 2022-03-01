echo on
Echo zipping...
Set PackFilePath="C:\Program Files (x86)\Steam\steamapps\common\Quake 4\mod\game000.pk4"
Set GameExePath="C:\Users\josue\OneDrive\Documents\Coding\GitHub\Win32\Release\Gamex86.dll"
"C:\Program Files\7-Zip\7z.exe" a -tzip %PackFilePath% %GameExePath%
echo Done!

Echo deleting old File...
Set NonZipDllPath="C:\Program Files (x86)\Steam\steamapps\common\Quake 4\mod\gamex86.dll"
del %NonZipDllPath% /s /f /q
echo Done!

Echo Starting Mod
Set ShortcutPath="Q4Mod"

start "" %ShortcutPath%
echo Done!