echo "Welcome to InsEmu"
echo "What do you want to emulate?"
echo "type 1 to emulate windows (.exe)"
echo "type 2 to emulate wii/gamecube (.iso and .wad)"
echo "type 3 to emulate xbox (.iso)"
echo "type 4 to emulate godot (.godot project folders)"
echo "type 5 to uninstall everything(plz report bugs on this)"
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
elif [[ $ans1 -eq 2 ]]
then
  sudo apt update
  sudo apt install flatpak
  sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  sudo flatpak install flathub org.DolphinEmu.dolphin-emu
  sudo chown root:root /usr/bin/bwrap && sudo chmod u+s /usr/bin/bwrap
  echo "Go into your apps and open dolphin emulator!"
  ./InsEmu/main.sh

elif [[ $ans1 -eq 3 ]]
then
  sudo apt update
  sudo apt install flatpak
  sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  sudo flatpak install flathub app.xemu.xemu
  sudo chown root:root /usr/bin/bwrap && sudo chmod u+s /usr/bin/bwrap
  ./InsEmu/main.sh
elif [[ $ans1 -eq 4 ]]
then
   sudo apt update 
   sudo apt install godot3
elif [[ $ans1 -eq 5 ]]
then
    chmod 755 InsEmu/uninstall.sh
    ./InsEmu/uninstall.sh
else [[ $ans1 -eq 6 ]]
    echo "Please enter one of the following"
    ./InsEmu/main.sh
fi
