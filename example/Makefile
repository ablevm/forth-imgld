IMG=forth.img
SRCS=example1.scr example2.scr example3.scr

.PHONY: all
all: ${IMG}

.PHONY: clean
clean:
	-rm -vf ${IMG}
	-rm -vf *.blk

${IMG}: ${IMG}.def ${SRCS}
	cp ${IMG}.def ${IMG}
	img -r 1M ${IMG}
	../imgld -o ${IMG} -b 524288 ${SRCS}
