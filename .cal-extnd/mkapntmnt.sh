day=`date +%d`
day=`expr $day + 1`
month=`date +%m`
year=`date +%Y`
echo ''
DAY=0
while [ $DAY -lt 1 -o $DAY -gt 31 ]
do
	read -p "On what day do you have the appointment?(DD/default: $day (Tomorrow)): " DAY
	if [ -z $DAY ]
	then
		DAY=$day
	elif [ $DAY -lt 1 -o $DAY -gt 31 ]
	then
		echo "Invalid Input! Please provide a valid day or hit return for tomorrow."
	fi
done
MONTH=0
while [ $MONTH -lt 1 -o $MONTH -gt 12 ]
do
	read -p "On what month do you have the appointment?(MM/default: $month (This month)): " MONTH
	if [ -z $MONTH ]
	then
		MONTH=$month
	elif [ $MONTH -lt 1 -o $MONTH -gt 12 ]
	then
		echo "Invalid Input! Please provide a valid month or hit return for this month."
	fi
done
YEAR=9999999
while [ $YEAR -gt 9999 ]
do
	read -p "In what year do you have the appointment?(YYYY/yy/default: $year (This year)): " YEAR
	if [ -z $YEAR ]
	then
		YEAR=$year
	elif [ $YEAR -gt 71 -a $YEAR -lt 100 ]
	then
		YEAR=`expr $YEAR + 1900`
	elif [ $YEAR -ge 0 -a $YEAR -lt 72 ]
	then
		YEAR=`expr $YEAR + 2000`
	elif [ $YEAR -gt 9999 ]
	then
		echo "Invalid Input! Please provide a valid year or hit return for this year."
	fi
done
read -p "The time of your appointment?(optional): " TIME
read -p "Describe you appointment(optional): " DSCRPTN
CALENTRY="$DAY $MONTH $YEAR : $TIME >> $DESCRIPTION"
echo $CALENTRY >> calfile
