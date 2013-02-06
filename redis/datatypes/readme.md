Datatypes and Uses
===========

### Strings -
 * Max size of 512 Megabytes
 * to avoid converting your already encoded data (JSON, HTML)
 * bitmaps and in general random access arrays of bytes


### Lists - 
 * Max length of a list is 232 - 1 elements (4294967295, more than 4 billion of elements per list).
 * when you are likely to touch only the extremes of the list: near tail, or near head
 * capped collection of N items where usually we access just the top or bottom items, or when N is small

### Sets -  
 * Max number of members in a set is 232 - 1 (4294967295, more than 4 billion of members per set).
 * to check for existence or size of the collection in a very fast way
 * random elements peeking or popping
 * to represent relations (nb: sotrted sets might be more interesting)

### Hashes - 
 * Every hash can store up to 232 - 1 field-value pairs (more than 4 billion).
 * to represent objects, composed of fields and values
 * to represent linked data structures, using references

### Sorted Sets
 * maintain ordered lists of unique elements
 * describe relations
 * paginate the list of items and to remember the ordering
 * priority queues

Source is a combination of:
[Main Redis Docs](http://redis.io/topics/data-types)
[Popescu's breakdown](http://nosql.mypopescu.com/post/18977451039/redis-guide-what-each-redis-data-type-should-be-used)
[Antirez answer on SOF](http://stackoverflow.com/questions/9625246/what-are-the-underlying-data-structures-used-for-redis/9626334)