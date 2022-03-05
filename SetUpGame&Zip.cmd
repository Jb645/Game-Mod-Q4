echo on
Echo zipping...
Set PackFilePathLaptop="C:\Program Files (x86)\Steam\steamapps\common\Quake 4\mod\game000.pk4"
Set PackFilePathDesktop="D:\SteamLibrary\steamapps\common\Quake 4\mod\game000.pk4"

Set GameExePathLaptop="C:\Users\josue\OneDrive\Documents\Coding\GitHub\Win32\Release\Gamex86.dll"
Set GameExePathDesktop="D:\GitHub\IT266-GameMod\Win32\Release\Gamex86.dll"

if exist %PackFilePathLaptop% (
echo Using Laptop!
"C:\Program Files\7-Zip\7z.exe" a -tzip %PackFilePathLaptop% %GameExePathLaptop%
echo Done!
)

if exist %PackFilePathDesktop% (
echo Using Desktop!
"D:\Programs\7-Zip\7z.exe" a -tzip %PackFilePathDesktop% %GameExePathDesktop%
echo Done!
)


Echo deleting old File...
Set NonZipDllPathLaptop="C:\Program Files (x86)\Steam\steamapps\common\Quake 4\mod\gamex86.dll"
Set NonZipDllPathDesktop="D:\SteamLibrary\steamapps\common\Quake 4\mod\gamex86.dll"

if exist %NonZipDllPathLaptop% (
del %NonZipDllPathLaptop% /s /f /q
echo Done!
)

if exist %NonZipDllPathDesktop% (
del %NonZipDllPathDesktop% /s /f /q
echo Done!
)

Echo Starting Mod
Set ShortcutPathLaptop="Q4Mod"
Set ShortcutPathDesktop="D:\GitHub\IT266-GameMod\Game-Mod-Q4\Q4ModDesktop"

if exist %PackFilePathLaptop% (
start "" %ShortcutPathLaptop%
) 
if exist %PackFilePathDesktop% (
start "" %ShortcutPathDesktop%
)