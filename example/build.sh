#!/bin/sh

set -e

. ../imgld.subr

include() {
	if [ "${file#*.}" = "scr" ]; then
		scr -r "$file" "$name.blk"
		size=$(wc -c < "$name.blk")
	fi
	img -s $addr -i $size forth.img < "$name.blk"
	able forth.img <<EOF | grep -v "^ ok" || true
: $name/ ( u1 - u2)  # $(($addr / 1024)) + ;
bye
EOF
}

cp forth.img.def forth.img
img -r 1M forth.img
imgld include $((512 * 1024)) example1.scr example2.scr example3.scr
rm -f *.blk
