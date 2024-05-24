#!/system/bin/sh
cwd="$(dirname $(realpath $0))"
##
if [ ! -d "$cwd/txt" ]
then
mkdir $cwd/txt
fi
#
if [ -f "$cwd/newSrt.srt" ]
then
busybox echo -e "menghapus subrip lama..\n"
rm $cwd/newSrt.srt
fi
###
checktxt="$(ls $cwd/txt)"
if [ ! -z "$checktxt" ]
then
rm -f $cwd/txt/*.txt
fi
###
if [ -z "$1" ]
then
echo "Usage: sh $0 /path/srtFile"
kill -9 $$
fi

if [ -z "$(echo $1|grep /)" ]
then
echo "Silahkan input berkas dengan jalur"
kill -9 $$
fi

if [ ! -z "$2" ]
then
busybox echo -e "\nBerkas/jalur tidak boleh mengandung spasi"
kill -9 $$
fi
####
busybox echo -e "\nMenghitung jumlah kata di subjudul $(basename $@)...\nSilahkan tunggu.\n"
busybox echo -e "#!/system/bin/sh\n#cd $cwd/txt\nsubrip=\"$@\"" > "$cwd/02-$(basename $0)"
cat "$@"|busybox awk -v path=$cwd '{print "NUMBER" NR+0 "=\"" NR+0 "\"\nstring" NR+0 "=\"" $0 "\"\nfile" NR+0 "=\"\$(busybox printf \x27%06d.%s\\n\x27 \"\$NUMBER" NR+0 "\" \"txt\")\"\necho \"\$string" NR+0 "\" > \"" path "/txt/\$file" NR+0 "\"\nsh " path "/NewLineBuilder3.sh " path "/txt/\$file" NR+0"\n##"}' >> "$cwd/02-$(basename $0)"
echo "echo \"\$0 was done..\"" >> "$cwd/02-$(basename $0)"
# 1
echo "Membuat baris akan membutuhkan waktu lama, tergantung ukuran yang anda masukan"
sleep 3
sh "$cwd/02-$(basename $0)"
busybox echo -e "Membuat baris baru selesai\n$(basename $0) done..\n"
sleep 2
cat $cwd/newSrt.srt > "$(dirname $(realpath $@))/new-$(basename $@)"

