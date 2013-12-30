#!/bin/bash

 tmpFile="/tmp/ec2.info"
 ec2Info=`ec2-describe-instances > $tmpFile`
 instances=`cat $tmpFile | grep TAG | awk {'print $3'}`
 numOfInstances=`cat $tmpFile | grep INSTANCE | wc -l`
 you=`whoami`


 echo "Dear $you, I wanted to describe for you the current number of instances you have: $numOfInstances"
 echo "The instances you have, by hostname, are as follows ..."
 for instance in $instances
 do
      hostname=`cat $tmpFile | grep INSTANCE | grep $instance | awk {' print $4 '}`
      echo "$hostname"
 done
