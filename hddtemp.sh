echo "System Drive: $(tput setaf 3)`sudo hddtemp -n -uF /dev/sda`°F $(tput setaf 2) Hard Drive 1: $(tput setaf 3)`sudo hddtemp -n -uF /dev/sdb`°F $(tput setaf 2)"
echo "                     Hard Drive 2: $(tput setaf 3)`sudo hddtemp -n -uF /dev/sdc`°F $(tput setaf 2) Hard Drive 3: $(tput setaf 3)`sudo hddtemp -n -uF /dev/sdd`°F $(tput setaf 2)"
# I have 4 drives here that I'm monitoring. Add or remove as needed. Change them to reflect your setup.
