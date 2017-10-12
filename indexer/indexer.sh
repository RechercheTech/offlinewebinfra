#!/bin/bash

for i in `ls htmls`; do cat "htmls/$i" >> index.html; done

usage() {
		printf "\n Usage : $0 --docl10n <lang_code> <lang_string>\n"
		printf "\n lang_code - ISO 639-1 code for the additional language desired. Don't use this option if only English is desired."
		printf "\n lang_string - The language string that will be displayed. For example 'Gujarati' \n"
		printf "\n Example: To add Gujarati documentation in addition to the default Enlgish, execute 'indexer.sh --docl10n gu Gujarati' \n\n"
}

if [ $# -gt 0 ]

then

	case "$1" in

	--docl10n) # Check 2 arguments are given #
			if [ $# -lt 3 ]
			then
				usage
				exit
			fi
			
			sed -i -e 's@<a href="manual/mss-doc-latest/index.html" target="_blank">English</a>@&\&nbsp;\&nbsp;\&nbsp;<a href="manual/mss-doc-'"$2"'-latest/index.html" target="_blank"></i>'"$3"'</a>@g' index.html
			;;

	*) 	printf  "\n Invalid option. \n"
		usage
		exit
		;;

	esac
	
fi

cp ../index.html index.html.`date +"%Y%m%d_%H%M%S"`
mv index.html ../
