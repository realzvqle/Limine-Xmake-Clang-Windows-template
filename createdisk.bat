@echo off


copy limine.conf limine\boot\limine\limine.conf
if exist image\image.vhd del del image\image.vhd
if exist root rd root /s /q
md root
robocopy limine root /s
md root\system
copy kernel\oskrnl.elf root\system
echo Partition the drive now
diskpart /s c:\build\scripts\partition.txt
mkdir Z:\EFI\BOOT
robocopy root Z:\ /s
diskpart /s c:\build\scripts\detach.txt
