+++
categories = ["posts"]
description = "index page"
tags = ["tagitbitch", "laravel", "amazon sqs", "queues", "background processing"]
date = "2016-01-25T02:48:40+00:00"
menu = "posts"
title = "Laravel Queues with Amazon SQS"

+++

## Its all documented, still!

To do long running processes or things that are not needed to run in the request/response cycle, we can use Laravel Queues [Laravel Queues](http://laravel.com/docs/5.1/queues). It is so easy to do that with Laravel. L5 comes with different drivers, database, redis, sqs, some more queuing systems or you can implement your own to store these jobs and process them.

I have used database as the queue storage. This is a mistake with MySql(Postgres is better while handling lot of concurrency, think). Probably database is the worst choice to use as Job store because it doesnt scale, could not handle concurrency and lock issues (a lot of these) and there are very specilized systems to handle these kind of tasks(Queues, Job servers like Gearman). 

So, its better not to use database to handle this particular task. [Why not DB to handle queues](https://www.cloudamqp.com/blog/2015-11-23-why-is-a-database-not-the-right-tool-for-a-queue-based-system.html) 

Cloudamqp offers RabbitMQ as a service. I have used its pub/sub feature in an android app to send and receive messages(which is a bad to choice for this).

Now to SQS,

SQS is simple queue service/something is from Amazon. If your app is running in Amazon's servers or network, you can use the SQS. I don't think its a good to choose it when you are using someother cloud services. The aws clients do HTTP calls to interact with SQS. Not sure if it affects because of the network ? :XXX

Laravel comes with a simple and powerful queue config. For all the queues the config looks similar but for the SQS the 'queue' will be the SQS's queue URL not the Queue name. You got to give this URL in the config and place the jobs on it using the URL. If you are running the workers using supervisors, you got to change the `queue` option to URL not the name of the queue. 

Thats it. Laravel stores the failed jobs in failed_jobs table irrespective of your queue driver.

> Simple hard, complex easy