cal -3
day=`date +%d`
day=`expr $day + 1`
month=`date +%m`
year=`date +%Y`
echo ''
DAY=0
while [ $DAY -lt 1 -o $DAY -gt 31 ]
do
	echo "On what day do you have the appointment?(DD/default: $day (Tomorrow)): "
	read DAY
	if [ $DAY -eq '' ]
	then
		DAY=$day
	elif [ $DAY -lt 1 -o $DAY -gt 31 ]
		echo "Invalid Input! Please provide a valid day or hit return for tomorrow."
	fi
done
MONTH=0
while [ $MONTH -lt 1 -o $MONTH -gt 12 ]
do
	echo "On what month do you have the appointment?(MM/default: $month (This month)): "
	read MONTH
	if [ $MONTH -eq '' ]
	then
		MONTH=$month
	elif [ $MONTH -lt 1 -o $MONTH -gt 12 ]
		echo "Invalid Input! Please provide a valid month or hit return for this month."
	fi
done
YEAR=9999999
while [ $YEAR -gt 9999 ]
do
	echo "In what year do you have the appointment?(YYYY/yy/default: $year (This year)): "
	read YEAR
	if [ $YEAR -eq '' ]
	then
		YEAR=$year
	elif [ $YEAR -gt 0 -a $YEAR -lt 100 ]
	then
		YEAR=`expr $YEAR + 2000`
	elif [ $YEAR -gt 9999 ]
		echo "Invalid Input! Please provide a valid year or hit return for this year."
	fi
done
echo "The time of your appointment?(optional): "
read TIME
echo "Describe you appointment(optional): "
read DSCRPTN
CALENTRY="$DAY $MONTH $YEAR : $TIME >> $DESCRIPTION"
echo $CALENTRY >> calfile
