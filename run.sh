#!/bin/sh
while :; do
   $PWD/starter -cloud cloud.eesdr.com:5450 -relay cloud.eesdr.com:5454 -http 8080
   sleep 2
done
