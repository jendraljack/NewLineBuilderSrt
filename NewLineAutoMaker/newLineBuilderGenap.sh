#!/system/bin/sh
cwd="$(dirname $(realpath $0))"
if [ -z "$1" ]
then
echo "Usage: $0 /path/file"
kill -9 $$
fi
### in the begining
if [ -e "$cwd/1.txt" ]
then
rm "$cwd/1.txt"
fi
if [ -e "$cwd/1.3.txt" ]
then
rm "$cwd/1.3.txt"
fi
if [ -e "$cwd/2.txt" ]
then
rm "$cwd/2.txt"
fi
if [ -e "$cwd/2.3.txt" ]
then
rm "$cwd/2.3.txt"
fi
# 1
jumlahkata="$(busybox wc -w $@|busybox awk '{print $1}')"
echo "semua kata berjumlah: $jumlahkata"
bagi2="$(($jumlahkata/2))"
echo "garis pertama diakhiri dikata: ke $bagi2"
garisbaru="$(($jumlahkata-$bagi2+1))"

for i in $(busybox seq 1 $bagi2);
do
    echo "\$$i\" \"" >> "$cwd/1.txt"
done
#busybox seq 1 $bagi2 > "$cwd/1.txt"
busybox echo -e "garis baru dimulai dari: $garisbaru dan diakhiri pada $jumlahkata\nmembuat garis baru..."
# > "$cwd/1.txt"
for i in $(busybox seq "$garisbaru" "$jumlahkata");
do
echo "\$$i\" \"" >> "$cwd/2.txt"
done
####
cat "$cwd/1.txt"|busybox tr '\n' '#' > "$cwd/1.3.txt"
busybox sed -i "s|#| |g" $cwd/1.3.txt
cat $cwd/1.3.txt|busybox awk -v ex="$@" '{print "cat " ex "|busybox grep -e \"[a-zA-Z]\"|busybox awk \x27{print " $0 "}\x27 > \$(dirname \$(realpath \$0))/numorder.srt"}' > $cwd/02-$(basename $0)
##
cat "$cwd/2.txt"|busybox tr '\n' '#' > "$cwd/2.3.txt"
busybox sed -i "s|#| |g" $cwd/2.3.txt
cat $cwd/2.3.txt|busybox awk -v ex="$@" '{print "cat " ex "|busybox grep -e \"[a-zA-Z]\"|busybox awk \x27{print " $0 "}\x27 >> \$(dirname \$(realpath \$0))/numorder.srt"}' >> $cwd/02-$(basename $0)
sh "$cwd/02-$(basename $0)"
mv -f $cwd/numorder.srt "$@"
# 1
echo "$0 oke..."
