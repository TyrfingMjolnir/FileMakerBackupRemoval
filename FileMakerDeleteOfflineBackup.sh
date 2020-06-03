#!/bin/bash
# Written by Gjermund Gusland Thorsen 1998 - Published in 2020; after upgrade from FM14 to FM18 and expr to $(())

# During this time there has been different approaches to offlining the backups; netatalk, samba/CIFS, NFS, scp, rsync
# If your server is on a Windows machine, simply turn on file sharing for the Data/Backups folder and mount that folder on a system of your liking.

#Keep instances of
keepHourly=23
keepDaily=5
keepWeekly=52 implemented on !gh, as a copy of Daily.

cd /Volumes/backup/
for P in FM18S00; do
    cd $P
    h=$( ls -1t | grep Hourly_ | wc -l )
    d=$( ls -1t | grep Daily_  | wc -l )
    w=$( ls -1t | grep Weekly_ | wc -l )
#    echo "Hourly $h"
#    echo "Daily  $h"
#    echo "Weekly $w"
#    echo "Keep Hourly $keepHourly"
#    echo "Keep Daily  $keepDaily"
#    echo "Keep Weekly $keepWeekly"
#    echo "Hourly"
    hc=0
    for D in Hourly_*; do
        if [ $hc -gt $(( $h - $keepHourly - 1 )) ] # Keep latter $keepHourly hours of the Hourly_* backups
        then
#            echo "Keep $hc $D"
        else
#            echo "Remove $hc $D"
            rm -fr $D
        fi
        hc=$(($hc + 1))
    done

#    echo "Daily"
    dc=0
    for D in Daily_*; do
        if [ $dc -gt $(( $d - $keepDaily - 1 )) ] # Keep latter $keepDaily days of Daily_* backups
        then
#            echo "Keep $dc $D"
        else
#            echo "Remove $dc $D"
            rm -fr $D
        fi
        dc=$(($dc + 1))
    done

#    echo "Weekly"
    wc=0
    for D in Weekly_*; do
        if [ $wc -gt $(( $w - $keepWeekly - 1 )) ] # Keep latter $keepWeekly days of Weekly_* backups
        then
#            echo "Keep $wc $D"
        else
#            echo "Remove $wc $D"
            rm -fr $D
        fi
        wc=$(($wc + 1))
    done

    cd ..
done
