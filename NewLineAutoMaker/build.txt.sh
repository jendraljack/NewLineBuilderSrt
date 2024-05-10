#!/system/bin/sh
cwd="$(dirname $(realpath $0))"
##
if [ ! -d "$cwd/txt" ]
then
mkdir $cwd/txt
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
####
busybox echo -e "#!/system/bin/sh\ncd $cwd/txt" > "$cwd/02-$(basename $0)"
cat "$@"|busybox awk '{print "NUMBER" NR+0 "=" NR+0 "\nstring" NR+0 "=\"" $0 "\"\nfile" NR+0 "=\$(busybox printf \x27%05d.%s\\n\x27 \"\$NUMBER" NR+0 "\" \"txt\")\necho \"\$string" NR+0 "\" > \"\$file" NR+0 "\"" }' >> "$cwd/02-$(basename $0)"
echo "echo \"\$0 was done..\"" >> "$cwd/02-$(basename $0)"
# 1
sh "$cwd/02-$(basename $0)"
echo "$(basename $0) done.."

