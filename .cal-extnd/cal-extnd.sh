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
touch ~/.cal-extnd/.buflike
XEND=0
MONTH[0]="January"
MONTH[1]="February"
MONTH[2]="March"
MONTH[3]="April"
MONTH[4]="May"
MONTH[5]="June"
MONTH[6]="July"
MONTH[7]="August"
MONTH[8]="September"
MONTH[9]="October"
MONTH[10]="November"
MONTH[11]="December"
if [ $# -gt 0 ]
then
	r=0
	i=0
	re="^[0-9]+$"
	for arg in $*
	do
		if ! [ $arg -eq ${ARGS[0]} -o $arg -eq ${ARGS[1]} -o $arg -eq ${ARGS[2]} -o $arg -eq ${ARGS[3]} -o $arg -eq ${ARGS[4]} -o $arg =~ $re]
		then
			ORIG[$r]=$arg
			r=`expr $r + 1`
		else
			RIM[$i]=$arg
			i=`expr $i +1`
		fi
	done
	if [ ${#ORIG[@]} -gt 0 ]
	then
		cal ${ORIG[*]} >> ~/.cal-extnd/.buflike
	fi
	if [ ${#RIM[@]} -gt 0 ]
	then
		n=1
		for ARG in ${RIM[@]}
		do
			if [ $ARG -eq ${ARGS[0]} ]
			then
				#dosomethimg
			elif [ $ARG -eq ${ARGS[1]} ]
			then
				#dosomething
			elif [ $ARG -eq ${ARGS[2]} ]
			then
				#dosomething
			elif [ $ARG -eq ${ARGS[3]} ]
			then
				#dosomething
			elif [ $ARG -eq ${ARGS[4]} ]
			then
				#dosomething
				XEND=1
			else
				#DOSOMETHINGELSE
			fi
			n = `expr $n + 1`
		done
	fi
	if [ $XEND == 1 ]
	then
		if [ -s ~/.cal-enxtnd/.buflike ]
		then
			cat ~/.cal-extnd/.buflike
		else
			cal -3
		fi
		bash ~/.cal-extnd/mkapntmnt.sh
	fi
else
	cal
fi
rm ~/.cal-extnd/.buflike

