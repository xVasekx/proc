#! /bin/bash
#
echo PID $'\t' PPID $'\t' STATE $'\t'$'\t' COMMAND
echo --------  -------  ------- $'\t' -------

#numpc=/proc/$1
allpids=`ls /proc | grep -P ^[0-9] | sort -n | xargs`

for pid in ${allpids}
do
	procpid=/proc/${pid}
	a=$(cat $procpid/status | grep -E ^Pid | awk '{print $2}')
	b=$(cat $procpid/status | grep -E ^PPid | awk '{print $2}')
	c=$(cat $procpid/status | grep -E State | awk '{print $2 $3}')
	d=$(cat $procpid/cmdline | sed 's/\x0/ /g')
	echo "${a}" $'\t' "${b}" $'\t' "${c}" $'\t' "${d}"
done
