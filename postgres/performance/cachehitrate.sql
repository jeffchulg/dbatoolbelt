#http://www.craigkerstiens.com/2012/10/01/understanding-postgres-performance/
#If you find yourself with a ratio significantly lower than 99% 
#then you likely want to consider increasing the cache available to your database

SELECT 
  sum(heap_blks_read) as heap_read,
  sum(heap_blks_hit)  as heap_hit,
  (sum(heap_blks_hit) - sum(heap_blks_read)) / sum(heap_blks_hit) as ratio
FROM 
  pg_statio_user_tables;