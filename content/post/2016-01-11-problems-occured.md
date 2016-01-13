+++
categories = ["posts", "laravel"]
description = "List of problems faced"
tags = ["laravel", "laravel 5.1", "laravel queues", "problems", "tagitbitch"]
date = "2016-01-11T11:51:01+00:00"
menu = "posts"
title = "List of problems occured"

+++

## Some!

* [Jobs table deadlock issue with Laravel queues](https://stackoverflow.com/questions/32475853/how-to-avoid-jobs-db-table-locks-issue-when-using-laravel-queues "Jobs table deadlock issue with Laravel queues")

The above is solved with

When using SELECT ... FOR UPDATE statements, you may observe lock contention(dead locks etc..).
select … for update where x <= y
its that range scan with <=
the database locks all rows <= y, including any gaps
so if you have rows with y like this: 1, 3, 5
it locks even the empty space between 1 and 3 in the index
its called gap locking

can see the issue with this command:
SHOW ENGINE INNODB STATUS;

---TRANSACTION 72C, ACTIVE 755 sec
4 lock struct(s), heap size 1248, 3 row lock(s), undo log entries 1
MySQL thread id 3, OS thread handle 0x7f84a78ba700, query id 163 localhost msandbox
TABLE LOCK table test.t trx id 72C lock mode IX
RECORD LOCKS space id 19 page no 4 n bits 80 index age of table test.t trx id 72C lock_mode X
RECORD LOCKS space id 19 page no 3 n bits 80 index GEN_CLUST_INDEX of table test.t trx id 72C lock_mode X locks rec but not gap
RECORD LOCKS space id 19 page no 4 n bits 80 index age of table test.t trx id 72C lock_mode X locks gap before rec
last line

If you have lot of gaps locks in your transactions affecting the concurrency and the performance you can disable them in two different ways:

1- Change the ISOLATION level to READ COMMITTED. In this isolation level, it is normal and expected that query results can change during a transaction, so there is no need to create locks to prevent that from happening.

2- innodb_locks_unsafe_for_binlog = 1. Disables the gap locks except for foreign-key constraint checking or duplicate-key checking.

https://www.percona.com/blog/2012/03/27/innodbs-gap-locks/ 
