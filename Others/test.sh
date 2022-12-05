#!/bin/bash
for file in ~/Desktop/AWK/AWK/test/*
do
echo $file
if $file
then
echo SUCCESS
else
echo FAIL
fi
done