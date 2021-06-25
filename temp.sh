echo "$(tput setaf 2)CPU1:$(tput setaf 3) `sensors -f | grep Core\ 0 | awk '{ print $3 }'` $(tput setaf 2)CPU2:$(tput setaf 3) `sensors -f | grep Core\ 1 | awk '{ print $3 }'` $(tput setaf 2)"
# after you install and setup lm-sensors, you can check to see what your cpu is called. mine was "Core 0", this monitors both my CPUs, modify this to your needs.
