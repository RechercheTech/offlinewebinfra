#!/bin/bash
for i in `ls htmls`; do cat "htmls/$i" >> index.html; done
cp ../index.html index.html.`date +"%Y%m%d_%H%M%S"`
mv index.html ../

