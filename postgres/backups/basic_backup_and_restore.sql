--Backups
pg_dump -U postgres crackers -f "M:\Backups\Crackers2.backup"


--Restore
--psql -U {user-name} -d {desintation_db}-f {dumpfilename.sql}
psql -U postgres -d stackoverfaux < /home/user/backups/SOF.backup





--Compressed Backup
pg_dump -Fc "megaapp" > M:\Backups\megaapp_compressed.bak

--Restore
createdb "megalove"
pg_restore -d "megalove" -Fc m:\Backups\megaapp_compressed.bak

