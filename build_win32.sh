Program=OpenPhotometer
Archfpc=$1
if [ "x$Archfpc" = "x" ]; then
  Arch=`dpkg --print-architecture`
  Archfpc=$(fpc -h | grep 'Compiler version' | sed 's/.*for \([^ ]\+\)$/\1/')
fi
if [ "x$Arch" = "x" ]; then
  if [ "x$Archfpc" = "xx86_64" ]; then
    Arch=amd64
  fi
  if [ "x$Arch" = "x" ]; then
    Arch=$Archfpc
  fi
fi
sudo -S echo "Arch is $Arch"
echo "Archfpc is $Archfpc"
Year=`date +%y`
Month=`date +%m`
Day=`date +%d`
Date=20$Year$Month$Day
TmpDir=/tmp
BuildDir=$TmpDir/software_build

zip OpenPhotometer_win32.zip $Program.exe

