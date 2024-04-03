#!/bin/bash

# Find files with colon 'file:name.ext'
find . -exec echo '{}' \; | grep '"' > /tmp/quote-files.list

# Show files
cat /tmp/quote-files.list

# Rename files
while read line; do
    mv "$line" "${line//\"/_}"
done < /tmp/quote-files.list