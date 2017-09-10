
OUTPUT=$(curl -q -X POST -u admin:admin http://localhost:4502/bin/groovyconsole/post.json -Fscript=@$1 2>/dev/null)

ERROR=$(echo $OUTPUT | jq -r '.exceptionStackTrace')

if [ "$ERROR" != "" ]; then
	echo "ERROR:"
	echo $OUTPUT | jq -r '.exceptionStackTrace'
	exit
else
	echo $OUTPUT | jq -r '.output'
fi

