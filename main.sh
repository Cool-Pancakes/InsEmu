echo "Welcome to InsEmu"
echo "What do you want to emulate?"
echo "type 1 to emulate windows (.exe)"
echo -n ": "
read ans1
if [[ $ans1 -eq 1 ]]
then
  echo "Widows"
else [[ $ans1 -eq 2 ]]
  echo "No Widows"
fi
