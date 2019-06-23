#!/bin/bash
  
for file in $(find ./tools -perm +111 -type f -or -type l | grep -E -v "\.sh|\.py|\.bin|\.out|\.ELF64|.universal|\.txt")
do
        dylibbundler -of -b -d ../Libraries/ -p /Applications/YOUR_APP_NAME.app/Libraries -x $file
done
