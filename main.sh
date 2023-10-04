echo "Welcome to InsEmu"
echo "What do you want to emulate?"
echo "type 1 to emulate windows (.exe)"
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
else [[ $ans1 -eq 2 ]]
  echo "Please type one of the listed items"]
fi
