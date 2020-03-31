# File Maker Backup Backup Removal
Here is a script to delete backups from your offline FileMaker Backup folder; in other words curating your offline backup.

Sample crontab offline backup method
```Shell
5 * * * * /usr/bin/rsync -av backup@fm18s00:/Library/FileMaker Server/Data/Backups/* /home/backup/FM18S00/ && /usr/bin/chown -R backup:staff /home/backup/FM* && /usr/bin/chmod -R 760 /home/backup/FM*
```
