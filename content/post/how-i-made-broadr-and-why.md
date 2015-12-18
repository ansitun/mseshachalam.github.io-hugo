
+++
categories = ["development", "git", "personal"]
description = "Some useful git commands for daily usage"
tags = ["Development", "git"]
date = "2015-12-18T05:20:32+00:00"
title = "How I made Broadr and Why"
slug = "broadr-is-dead"
markup = "md"
+++

##Now its dead

###Overview

Broadr is an app which broadcasts messages in a location to all the users of the same location in realtime. If the message sender is in Bangalore then it will be broadcast to all the users of the application in Bangalore. Broadr tries to be a notice board virtually in every location of the world same as a physical notice board like in Colleges or some Govt offices. Here, people can comment on the message, share it to the others through other applications. Right now the sender’s details are kept anonymous even though server knows the sender’s email id.


###Goals

1. Should work in real time.
2. Each broadcasted message should contain details about the message origin.
3. Should be easily extendable to other use cases.
4. Must not irritate users with flood of messages.
5. Server should be scalable.

###Specifications

The application uses GCM and CCS (Google cloud messaging) to send all the information from devices to server.
The server has two components.
There are APIs to serve the Messages and Comments to message.

###CCS component - [Node CCS](https://github.com/broadr/node-ccs "node-ccs")

It serves as bridge between the Google’s cloud connection server and our server. There will be multiple processes running to receive and send data between the CCS and APP Server.

###Application Server - [Server](https://github.com/broadr/server "broadr-server")

This serves as a API server and also deals all the database operations.

###Broadr Android Application - [Broadr](https://github.com/broadr/broadr "broadr")

The android application tries to implement all the best practices of development. It basically collects the user’s location and address. Sends all the data(user’s info, message content, comment content, location info etc...) through the Google CCS upstream method. Heavily uses the Google Play Services and GCM. It is a native app and employs heavy usage of threads, tries to be responsive and battery friendly.

### Supervisor Configurations - [Supervisor Conf](https://github.com/broadr/supervisor-confs "supervisor-confs")

All the background processes that are running on the server are controlled by the supervisor tool.

###Tools Used

1. PHP/Symfony2
	
    _Used to write the Server._
2. MySql

	_Stores all the users information, messages, locations, comments etc._
3. Redis

  _Serves as the communication buffer between different processes through its pub/sub._
4. Gearman

  _All the PHP processes will be getting their jobs from Gearman. Node JS processes can submit jobs to PHP processes._
5. Node JS

  _Due it’s async nature its works well with GCM CCS server. Sends/Receives messages through it. Gets messages to send to CCS server from Redis and gives jobs to PHP processes through Gearman._
6. Java

  _The broadr app is developed in native Java code._
  
###Use cases

1. Public events can be advertised
2. Accidents/Traffic/Calamities can be spread
3. Coupons/Offers from restaurants/malls/shops can be advertised
4. Many more
