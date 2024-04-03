#!/bin/bash

# Find files with colon 'file:name.ext'
find . -exec echo '{}' \; | grep ':' > /tmp/colon-files.list

# Show files
cat /tmp/colon-files.list

# Rename files
while read line; do
    mv "$line" "${line//:/_}"
done < /tmp/colon-files.list