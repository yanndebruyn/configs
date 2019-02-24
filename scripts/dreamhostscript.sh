
mysqldump -h databases.yanndebruyn.com -u yanndebruyn -p3F@dq5+b3g3d{qZ@ ellystaes_db > website_backups/mysqldatabase_backups/ellystaesbackup.sql

mysqldump -h databases.yanndebruyn.com -u yanndebruyn -p3F@dq5+b3g3d{qZ@ ellystaesclone_db > website_backups/mysqldatabase_backups/ellystaesclonebackup.sql

mysqldump -h databases.yanndebruyn.com -u yanndebruyn -p3F@dq5+b3g3d{qZ@ yanndebruyn_db > website_backups/mysqldatabase_backups/yanndebruynbackup.sql

mysqldump -h databases.yanndebruyn.com -u yanndebruyn -p3F@dq5+b3g3d{qZ@ yanndebruynclone_db > website_backups/mysqldatabase_backups/yanndebruynclonebackup.sql

tar -zcf website_backups/dezielsboom.com.tar.gz dezielsboom.com/
tar -zcf website_backups/ellystaes.com.tar.gz ellystaes.com/
tar -zcf website_backups/yanndebruyn.com.tar.gz yanndebruyn.com/
tar -zcf website_backups/ydur.org.tar.gz ydur.org/
