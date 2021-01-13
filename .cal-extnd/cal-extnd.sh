# -A num Print lines from today and next num days
# -B num Print lines from today and previous num days
# -l num Same as -A
# -w Print day of the week name in front of each event
# -E Prompts calendar entry
ARGS[0]="-A"
ARGS[1]="-B"
ARGS[2]="-l"
ARGS[3]="-w"
ARGS[4]="-E"

if [ $# -gt 0 ]
then
	n=1
	for arg in $*
	do
		if [ $arg -eq ${ARGS[0]} ]
		then
			#dosomethimg
		elif [ $arg -eq ${ARGS[1]} ]
		then
			#dosomething
		elif [ $arg -eq ${ARGS[2]} ]
		then
			#dosomething
		elif [ $arg -eq ${ARGS[3]} ]
		then
			#dosomething
		elif [ $arg -eq ${ARGS[4]} ]
		then
			#dosomething
			bash mkapntmnt.sh
		else
			r=0
			RIM[$r]=$n
			r=`expr $r + 1`
		fi

		n = `expr $n + 1`
	done
	if [ ${#RIM[@]} -gt 0 ]
	then
		cal ${RIM[*]}
	fi
else
	cal
fi


