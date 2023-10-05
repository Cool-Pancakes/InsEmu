echo "Welcome to InsEmu"
echo "What do you want to emulate?"
echo "type 1 to emulate windows (.exe)"
echo "type 2 to emulate wii/gamecube (.iso and .wad)"
echo "type 3 to emulate xbox (.iso)"
echo "Add a U to the start of the number Eg: U3 to uninstall instead of install"
echo -n ": "
read ans1
if [[ $ans1 -eq 1 ]]
then
  sudo dpkg --add-architecture i386
  wget -nc https://dl.winehq.org/wine-builds/winehq.key
  sudo apt-key add winehq.key
  echo "deb https://dl.winehq.org/wine-builds/debian/ bullseye main" | sudo tee /etc/apt/sources.list.d/wine_chrome_os_made_simple.list
  sudo apt update -y
  sudo apt install --install-recommends winehq-stable winbind
  winecfg
  sudo apt install nemo
  echo "Succsefully Completed!"
./InsEmu/main.sh
else [[ $ans1 -eq 2 ]]

  sudo apt update
  sudo apt install flatpak
  sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  sudo flatpak install flathub org.DolphinEmu.dolphin-emu
  sudo chown root:root /usr/bin/bwrap && sudo chmod u+s /usr/bin/bwrap
  echo "Go into your apps and open dolphin emulator!"
  ./InsEmu/main.sh
fi
if [[ $ans1 -eq 3 ]]
then
  sudo apt update
  sudo apt install flatpak
  sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  sudo flatpak install flathub app.xemu.xemu
  sudo chown root:root /usr/bin/bwrap && sudo chmod u+s /usr/bin/bwrap
  ./InsEmu/main.sh

else [[ $ans1 -eq U1 ]]

  echo "We do not have a way to uninstall this yet but we can deupdate it alot! We'll do that."
  rm -rf ~/.wine
  ./InsEmu/main.sh
fi
if [[ $ans1 -eq U2 ]]
then
  sudo flatpak uninstall flathub org.DolphinEmu.dolphin-emu
  echo "It will take a little while to update on your apps"
  ./InsEmu/main.sh
 
else [[ $ans1 -eq U3 ]]

  sudo flatpak uninstall flathub app.xemu.xemu
  echo "It will take a little while to update on your apps"
  ./InsEmu/main.sh
fi  
if
then
  echo "Please say one of the listed items"
  ./InsEmu/main.sh
fi
