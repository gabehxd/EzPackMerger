@echo off
mkdir base1\
mkdir base2\
mkdir output\

xcopy %1 "base1\"
cd "base1"
packwiz.exe curseforge import %1
cd ..

xcopy "base1\" "output\" /S /Y

xcopy %2 "base2\"
cd "base2"
packwiz.exe curseforge import %2
cd ..

xcopy "base2\" "output\" /S /Y

cd "output\"
del %1
del %2

packwiz.exe refresh
packwiz.exe curseforge export