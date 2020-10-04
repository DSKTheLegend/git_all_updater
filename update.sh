#!/bin/bash

BASE_DIR="/shared"
L="/var/tmp"

LATEST_LOG="$L/git_updater.latest"
LOG_FILE="$L/git_updater.log"

echo >> $LOG_FILE
cat $LATEST_LOG >> $LOG_FILE
cat /dev/null > $LATEST_LOG

echo "****************************************************" >> $LATEST_LOG
echo "****** `date` ******" >> $LATEST_LOG
echo "****************************************************" >> $LATEST_LOG

for file in $BASE_DIR/*; do
  if [ -d "$file" ]; then
    echo ________________________________ >> $LATEST_LOG
    echo $file | awk -F"/" '{ print $3 }' >> $LATEST_LOG
    echo ================================ >> $LATEST_LOG
    cd $file
    git pull >> $LATEST_LOG
  fi
done

