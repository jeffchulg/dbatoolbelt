# Monitor all transactions-
monitor   --wonderful, but you don't want to do it in production

# Slow queries - by setting this to 0, it basically becomes a profiler.
config set slowlog-log-slower-than 0

slowlog get
slowlog get 10


# Memusage  get the amount of mem used
redis-cli info | grep used_memory_human

# Monitor the instance with redmon
gem install redmon
redmon

# Backups - 
Just copy the  dump.rdb
Much like with relationaldb's, if this is io intense, set up a slave and back up off of it.

