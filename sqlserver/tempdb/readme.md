TempDB
===========

You should try to give TempDB its own LUNS (raid 10)... bonus if you can get it on an SSD.
You should have multiple tempdb files.  (and  IFI already turned on)

Things that use tempdb (or - why is this important)
----
 * Snapshot isolation and read committed snapshot (RCSI)
 * MARS
 * Online index creation, rebuilds with SORT_IN_TEMPDB
 * Temporary tables, table variables, and table-valued functions
 * DBCC CHECK
 * LOB parameters
 * Cursors
 * Service Broker and event notification
 * XML and LOB variable
 * Query notifications
 * Database mail
 * User-defined functions
 * Sort
 * Hash match
 * Spool
 * Version store
[source](http://sqlserverpedia.com/wiki/TempDB/)

[good stackoverflow answer for tempdb optimiation](http://stackoverflow.com/a/362636/91254)
