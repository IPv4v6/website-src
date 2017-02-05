#!/usr/bin/env bash

set -e
set -u

WORKDIR=`pwd`
DESTDIR=~/DESTDIR
PAGEDIR=${WORKDIR}/pages
TMPLDIR=${WORKDIR}/templates
CSSDIR=styles
CSSFILE=ipv4v6.css

PAGELIST="index"

rm -rf ${DESTDIR}
mkdir -p ${DESTDIR}

for PAGE in ${PAGELIST} ; do
	pandoc -f markdown -t html5 --data-dir ${WORKDIR} --template ipv4v6 \
	--css ${CSSDIR}/${CSSFILE} -s -S \
	-o ${DESTDIR}/${PAGE}.html ${PAGEDIR}/${PAGE}.md
done
cp -a ${CSSDIR} ${DESTDIR}
