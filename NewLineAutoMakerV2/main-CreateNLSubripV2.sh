#!/system/bin/sh
main="$(dirname $(realpath $0))"
if [ ! -d "$main/txt" ]
then
mkdir $main/txt
fi

if [ -z "$1" ]
then
echo "usage: sh $0 /path/subrip"
kill -9 $$
fi
##
if [ -f "$(dirname $(realpath $@))/new-$(basename $@)" ]
then
rm "$(dirname $(realpath $@))/new-$(basename $@)"
fi
##
sh "$main/build.txtV2.sh" "$@"
#sleep 1
sh "$main/NewLineBuilder2.sh"
#sleep 1
sh "$main/buildNewSrt.sh" "$@"
echo "$(basename $0) is done.."
rm -f $main/txt/*.txt

if [ ! -d "$main/cache" ]
then
mkdir $main/cache
fi

echo "Move cache to $main/cache"
find $main -name "02-*.sh" -type f > $main/cache.log
 find $main -name "*.txt" -type f >> $main/cache.log
cat $main/cache.log|busybox awk -v cache=$main/cache '{print "mv " $0,cache}' > $main/cache/02-$(basename $0)
