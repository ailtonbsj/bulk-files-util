#!/bin/bash

# Find files with end space 'filename.ext '
find . -exec echo '{}' \; | grep -v '^\.$' | grep '\.$' > /tmp/end-dot-files.list

# Show files
cat /tmp/end-dot-files.list

# Rename files
while read line; do
    mv "$line" "${line:0:-1}_"
done < /tmp/end-dot-files.list