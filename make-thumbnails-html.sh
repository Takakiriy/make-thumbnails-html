#!/bin/bash
#// Character Encoding: "WHITE SQUARE" U+25A1 is □.
set -eE
#// -eE option breaks execution, when an error was occurred.

function  Main_func()
{
	local  output_file_path="thumbnails.html"

	local  header=$(cat <<- __HERE_DOCUMENT__
		<!DOCTYPE HTML><html><head>
		<title>SVG List</title></head>
		<style type="text/css">
		img.thumbnail { width: 100px;  height: 100px; }
		</style>
		<body>
		__HERE_DOCUMENT__
	)

	local  footer=$(cat <<- __HERE_DOCUMENT__
		</body>
		</html>
		__HERE_DOCUMENT__
	)

	local  file_list=$( find . | grep ".svg\|.png\|.jpg\|.jpeg" )
	local  line
	rm -f  "${output_file_path}"

	echo  "${header}" >> "${output_file_path}"
	while read  relative_path ; do  #// read lines one by one from redirect "<" after this loop

		echo  "<p>${relative_path} <img class=\"thumbnail\" src=\"${relative_path}\"/></p>" >> "${output_file_path}"
	done < <( echo  "${file_list}" )

	echo  "${footer}" >> "${output_file_path}"
}
Main_func
