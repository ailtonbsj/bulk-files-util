#!/bin/bash

# Find files with end space 'filename.ext '
find . -exec echo '{}' \; | grep ' $' > /tmp/end-space-files.list

# Show files
cat /tmp/end-space-files.list

# Rename files
while read line; do
    mv "$line " "$line_"
done < /tmp/end-space-files.list