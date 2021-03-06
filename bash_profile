let upSeconds="$(/usr/bin/cut -d. -f1 /proc/uptime)"
let secs=$((${upSeconds}%60))
let mins=$((${upSeconds}/60%60))
let hours=$((${upSeconds}/3600%24))
let days=$((${upSeconds}/86400))
UPTIME=`printf "%d days, %02dh%02dm%02ds" "$days" "$hours" "$mins" "$secs"`

# get the load averages
read one five fifteen rest < /proc/loadavg

# Three external scripts were used. They either should be put in your home /scripts, or changed to reflect your setup.
# Line 22 should be changed to your system's drive location. You will need to edit the external scripts as well.
echo "$(tput setaf 2)
     $(tput setaf 7)---System Info---$(tput setaf 2)
Server Name........: $(tput setaf 3)`hostname`$(tput setaf 2)
Uptime.............: $(tput setaf 3)${UPTIME}$(tput setaf 2)
Reboot Required....: $(tput setaf 3)`$HOME/scripts/rbr`$(tput setaf 2)
     $(tput setaf 7)---Temperatures---$(tput setaf 2)
CPU Temperature....: `$HOME/scripts/temp.sh`
Hard Drive Temps...: `$HOME/scripts/hddtemp.sh`
     $(tput setaf 7)---Drive Space---$(tput setaf 2)
Free System Space..:$(tput setaf 3) `df -h | grep -E '^/dev/mapper/SERVER--vg-root' | awk '{ print $4 }'` $(tput setaf 2)
     $(tput setaf 7)---Other Info---$(tput setaf 2)
Information you want people to see upon login... or stuff from OLD STUFF. "u" is an alias...
Type u to update the system... type exit to leave
$(tput sgr0)"

### MORE STUFF ###
# These can be placed anywhere, just uncomment and move them! It works. Change the hard drives to match your setup.

# `date +"%A, %e %B %Y, %r"`
# `uname -srmo`$(tput setaf 2)
# Memory.............: `cat /proc/meminfo | grep MemFree | awk {'print ($2/1024)'}`MB (Free) / `cat /proc/meminfo | grep MemTotal | awk {'print ($2/1024)'}`MB (Total)
# Load Averages......: $(tput setaf 3)${one}, ${five}, ${fifteen} (1, 5, 15 min)$(tput setaf 2)
# IP Addresses.......:$(tput setaf 3) `hostname -I``wget -q -O - http://icanhazip.com/ | tail`$(tput setaf 2)
# Running Processes..: `ps ax | wc -l | tr -d " "`
# IP Addresses.......: `hostname -I``wget -q -O - http://icanhazip.com/ | tail`
# Data Disk Space....:$(tput setaf 3) `df -h /dev/sdb | grep -E '/dev/sdb' | awk '{ print $4 }'`$(tput setaf 2)
# Backup Disk Space..:$(tput setaf 3) `df -h /dev/sdd1 | grep -E '/dev/sdd1' | awk '{ print $4 }'`$(tput setaf 2)
# PS Disk Space......:$(tput setaf 3) `df -h /dev/sdc1 | grep -E '/dev/sdc1' | awk '{ print $4 }'`$(tput setaf 2)
# Weather............:$(tput setaf 3) `curl -s "http://rss.accuweather.com/rss/liveweather_rss.asp?metric=0&locCode=66075" | sed -n '/Currently:/ s/.*: \(.*\): \([0-9]*\)\([CF]\).*/\2°\3, \1/p'`$(tput setaf 2)

# OpenVPN status - you have to chmod or chown the log file for it to work. the file name is modified in the OpenVPN conf file.
# If you don't have OVPN, simply delete or comment the lines out.
if grep "10.8.0" /var/log/openvpn/status.txt >/dev/null;
  then echo "$(tput setaf 3)There are VPN sessions active!$(tput sgr0)" 
    grep "10.8.0" /var/log/openvpn/status.txt 
fi

# I use tmux to do updates, internet and power are freaky here...
muxt=`tmux ls  2>/dev/null | awk '{ print substr($1, 1, length($1)-1) }'`
if [ ! -z "$muxt" ]; then
   echo "There is a tmux session. To connect, type: $(tput setaf 3)tmux attach -t $muxt$(tput sgr0)"
fi
