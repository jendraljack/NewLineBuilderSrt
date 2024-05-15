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
if [ "$hitkat" = "0" ]
then
echo "Tidak perlu dibuat baris-baru, karena $hitkat <= 3"
kill -9 $$
fi
if [ "$hitkat" = "1" ]
then
echo "Tidak perlu dibuat baris-baru, karena $hitkat <= 3"
kill -9 $$
fi
##
if [ "$hitkat" = "2" ]
then
echo "Tidak perlu dibuat baris-baru, karena $hitkat <= 3"
kill -9 $$
fi
#
if [ "$hitkat" = "3" ]
then
echo "Tidak perlu dibuat baris-baru, karena $hitkat <= 3"
kill -9 $$
fi
##
if [ "$hitkat" -gt "3" ]
then
echo "Membuat garis baru..."
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