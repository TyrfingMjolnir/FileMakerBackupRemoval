# FileMaker Backup Backup Removal
Here is a script to delete backups from your offline FileMaker Backup folder; in other words curating your offline backup.

This is how I do offline backups
```
/usr/bin/rsync -av backup@fm18s00:/Library/FileMaker Server/Data/Backups/* /home/backup/fm18s00/
```

Notice the `-v` is there only for manually checking what is going on. Depending on how much you would like to be logged, you may or may not want to use `-v` in your script scheduler.

Written by Gjermund Gusland Thorsen 1998 - Published in 2020; after upgrade from FM14 to FM18 and `expr` to `$(())`

During this time there has been different approaches to offlining the backups; `netatalk`, `samba` / `CIFS`, `NFS`, `scp`, `rsync`. If your server is on a Windows machine, simply turn on file sharing for the `•Windows: [drive]:\Program Files\FileMaker\FileMaker Server\Data\Databases\`-folder and mount that folder in a system of your liking.

Sample crontab offline backup method
```Shell
5 * * * * /usr/bin/rsync -a backup@fm18s00:/Library/FileMaker Server/Data/Backups/* /home/backup/FM18S00/ && /usr/bin/chown -R backup:staff /home/backup/FM* && /usr/bin/chmod -R 760 /home/backup/FM*
```
Of course this could also be triggered by using systemctl( linux, ) launchctl( darwin / macos x, ) or svcadm( solaris / illumos )
