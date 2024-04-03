# Bulk files utils

```bash
# Generate hashes of all files
find . -type f -exec sha256sum '{}' \; | tee /tmp/hashes.list

# Sort all hashes
cat /tmp/hashes.list | sort | tee /tmp/hashes.sorted

# Find duplicates
cat /tmp/hashes.sorted | cut -d' ' -f1 | uniq -c | sort -r

# Find files with extra end space
find . -exec echo '"{}"' \; | grep ' "$'

# Get hashes really deleted
while read hash; do
    has=$(cat notdeleted.hashs | grep $hash | wc -l)
    if [ "$has" == "0" ]; then
        echo $hash
    fi
done < ./recovered.hashs

# Get list of file really deleted
while read hash; do
    cat recovered.sorted | grep $hash
done < ./really-deleted.hashs
```