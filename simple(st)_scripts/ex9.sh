find fake/dir ! -empty -type f -exec md5sum {} + | sort | uniq -w32 -dD
