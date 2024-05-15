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
