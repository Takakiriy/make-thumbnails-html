#!/bin/bash
#// Character Encoding: "WHITE SQUARE" U+25A1 is □.
set -eE
#// -eE option breaks execution, when an error was occurred.

function  Test_func()
{
	local  status=0
	local  is_same

	#// Set up
	rm -f  "thumbnails.html"

	#// Test Main
	../make-thumbnails-html.sh

	#// Check
	status=0

	diff  "thumbnails.html"  "thumbnails_answer.html" > /dev/null  || status=$?
	if [ "${status}" == "1" ];then
		is_same="false"
	else
		is_same="true"
	fi
	if [ "${is_same}" == "true" ]; then
		echo  "Pass."
	else
		echo  "FAIL"
	fi
}
Test_func
