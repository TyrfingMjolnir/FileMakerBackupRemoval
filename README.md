# File Maker Backup Backup Removal
Here is a script to delete backups of your FileMaker Backup folder; in other words curating your offline backup.

Sample crontab offline backup method
```Shell
5 * * * * /usr/bin/rsync -av /mnt/backup/fm18s00/* /home/backup/FM18S00/ && /usr/bin/chown -R backup:staff /home/backup/FM* && /usr/bin/chmod -R 760 /home/backup/FM*
```
