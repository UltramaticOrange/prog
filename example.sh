#!/bin/bash

##############################################################################
# This example assumes that the `prog` script is in the same directory, pwd. #
##############################################################################

cat "example.in" | while read "line"
do
  q=`echo "$line" | grep -Eio "QUEUE_RECV: [0-9]+" | grep -Eio "[0-9]+"`
  p=`echo "$line" | grep -Eio "PROCESSED: [0-9]+" | grep -Eio "[0-9]+"`
  ./prog $p $q
  sleep 0.5
done
echo # Note this final echo. `prog` does not print a newline and the end of execution.
