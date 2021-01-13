apt install util-linux
mv ./.cal-extnd ~/
cd ~/.cal-extnd
touch calfile
cd ~
if [ -f .bash_profile ]
then
	echo "alias cal=\"bash ~/.cal-extnd/cal-extnd.sh\"" >> .bash_profile
else
	touch .bash_profile
	echo "alias cal=\"bash ~/.cal-extnd/cal-extnd.sh\"" >> .bash_profile
fi
source .bash_profile

