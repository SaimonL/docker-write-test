#!/bin/bash

sleep 3

if [ -n "$TEST_PATH" ]; then
  echo "TEST_PATH is set to: $TEST_PATH"
else
  echo "TEST_PATH path is not SET"
fi

echo
ls -la $TEST_PATH

echo
echo "Create folder test..." 
mkdir -v $TEST_PATH/write-folder-test

echo
echo "Delete folder test..." 
rm -frv $TEST_PATH/write-folder-test

echo
echo "Create file test..." 
touch $TEST_PATH/write-test.tmp 

echo
echo "Write file test..." 
echo "Hello world" > $TEST_PATH/write-test.tmp 

sleep 1
echo
echo "Read file test..." 
cat $TEST_PATH/write-test.tmp 

echo
echo "Delete file test..." 
rm -v $TEST_PATH/write-test.tmp

echo
echo "Leaving proof"
echo "" >> $TEST_PATH/proof.txt
echo $(date) >> $TEST_PATH/proof.txt
echo "All test succeed" >> $TEST_PATH/proof.txt

echo
echo "File Test Complete"
