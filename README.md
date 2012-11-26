backup-db-app
=============

Backup Database App

1. To use backup app, create a new directory under the home called backups
2. Drop the backup_dbs.sh file and make it executable by running chmod +x backup_dbs.sh
3. Create one directory for each database you want to backup
4. In each database backup directory, create a .db file with database name in the first line just the .db-sample file
5. Schedule crontab by running crontab -e and inputing the folowing after the last line:

	 0 1 * * * /bin/bash -l -c 'cd /Users/developer/backups && backup_dbs.sh'

   this will make cron run the backup script everyday at 1 AM

6. Backed up files will use the naming convention: 2012-Sep-30-mydatabase.dump.psql


To-Do

1. Add crontab -e initialization to this script
 