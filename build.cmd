Rem EzioOS build script
rem because nasm is annoying and doesnt overwrite the old file
rem uyay
@echo off
title EzioOS build script
echo Deleting previous build
del bootsect.bin
echo building...
rem you need NASM in your path
nasm bootsec.asm -f bin -o bootsect.bin
echo done!