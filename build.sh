#!/usr/bin/env bash

set -e
set -u

WORKDIR=`pwd`
DESTDIR=~/DESTDIR
PAGEDIR=${WORKDIR}/pages
TMPLDIR=${WORKDIR}/templates

PAGELIST="index"

rm -rf ${DESTDIR}
mkdir -p ${DESTDIR}

for PAGE in ${PAGELIST} ; do
	pandoc -f markdown -t html5 --data-dir ${WORKDIR} --template ipv4v6 \
	-s -S -o ${DESTDIR}/${PAGE}.html ${PAGEDIR}/${PAGE}.md
done
