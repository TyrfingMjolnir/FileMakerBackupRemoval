# FileMaker Backup Backup Removal
Here is a script to delete backups from your offline FileMaker Backup folder; in other words curating your offline backup.

During this time there has been different approaches to offlining the backups; `netatalk`, `samba` / `CIFS`, `NFS`, `scp`, `rsync`. If your server is on a Windows machine, simply turn on file sharing for the `Data/Backups`-folder and mount that folder on a system of your liking.

Sample crontab offline backup method
```Shell
5 * * * * /usr/bin/rsync -av backup@fm18s00:/Library/FileMaker Server/Data/Backups/* /home/backup/FM18S00/ && /usr/bin/chown -R backup:staff /home/backup/FM* && /usr/bin/chmod -R 760 /home/backup/FM*
```
Of course this could also be done using systemctl( linux, ) launchctl( darwin / macos x, ) or svcadm( solaris / illumos )
