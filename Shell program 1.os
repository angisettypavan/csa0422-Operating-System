sum of n numbers
Code :
clear
echo "---------SUM OF N NUMBERS IN SHELL SCRIPT-----------"
echo -n "Enter nth number's value:"
read digit
t=1
total=0
while test $t -le $digit
do
        total=`expr $total + $t`
        t=`expr $t + 1`
done
echo "SUM OF $DIGIT: $total "

Output :
Enter nth number's value: 5

SUM OF : 15
