#!/system/bin/sh
if [ -z "$1" ]
then
echo "Usage: $0 /path/sub.srt"
kill -9 $$
fi
####
curd="$(dirname $(realpath $0))"
hitkat="$(busybox wc -w $@|busybox awk '{print $1}')"
echo "$@ words: $hitkat"
if [ "$hitkat" -lt "4" ]
then
echo "No need Making newline for words equal or lower than 3"
#/system/bin/sh "$curd/newLineBuilder.sh" "$@"
#sleep 1
kill -9 $$
fi
###
#busybox echo -e "No Need making Newline\nSkipped"
###
#echo $hitkat > $curd/checktype.txt
#check="$(cat $curd/checktype.txt)"
busybox awk -v angka=$hitkat 'BEGIN {print angka/2}' > $curd/genapAtauganjil.txt
cat $curd/genapAtauganjil.txt|busybox tr '.' '#' > $curd/genapAtauganjil2.txt
check="$(cat $curd/genapAtauganjil2.txt|busybox grep -e '#')"
#echo "Test $check"
if [ ! -z "$check" ]
then
echo "Angka ganjil: $hitkat"
/system/bin/sh "$curd/newLineBuilder.sh" "$@"
fi

if [ -z "$check" ]
then
echo "Angka genap: $hitkat"
/system/bin/sh "$curd/newLineBuilderGenap.sh" "$@"
fi
