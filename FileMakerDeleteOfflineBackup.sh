#!/bin/bash
# Written by Gjermund Gusland Thorsen 1998 - Published in 2020; after upgrade from expr to $(())

#Keep instances of
keepHourly=23
keepDaily=5
#keepWeekly not implemented, as you will most likely keep the last week of each month until drive is full.

cd /Volumes/backup/
for P in FM18S00; do
    cd $P
    h=$( ls -1t | grep Hourly_ | wc -l )
    d=$( ls -1t | grep Daily_  | wc -l )
    w=$( ls -1t | grep Weekly_ | wc -l )
    echo "Hourly $h"
    echo "Daily  $h"
    echo "Weekly $w"
    echo "Hourly"
    hc=0
    for D in Hourly_*; do
        if [ $hc -gt $(( $h - $keepHourly - 1 )) ] # Keep latter 24 hours of the Hourly_* backups
        then
            echo "Keep $hc $D"
        else
            echo "Remove $hc $D"
            rm -fr $D
        fi
        hc=$(($hc + 1))
    done

    echo "Daily"
    dc=0
    for D in Daily_*; do
        if [ $dc -gt $(( $d - $keepDaily - 1 )) ] # Keep latter 5 days of Daily_* backups
        then
            echo "Keep $dc $D"
        else
            echo "Remove $dc $D"
            rm -fr $D
        fi
        dc=$(($dc + 1))
    done

    cd ..
done
