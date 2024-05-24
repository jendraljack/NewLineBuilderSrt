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
busybox echo -e "\nTidak perlu dibuat baris-baru, karena $hitkat lebih kecil dari 4.\n"
#kill -9 $$
cat $@ >> $curd/newSrt.srt
rm -f $@
fi
##
if [ "$hitkat" -gt "3" ]
then
busybox echo -e "Membuat baris baru...\n\n"
#/system/bin/sh "$curd/newLineBuilder.sh" "$@"
#sleep 1
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
##
fi