5 * * * * /usr/bin/rsync -av backup@fm18s00:/Library/FileMaker Server/Data/Backups/* /home/backup/FM18S00/ && /usr/bin/chown -R backup:staff /home/backup/FM* && /usr/bin/chmod -R 760 /home/backup/FM*
