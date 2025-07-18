#!/bin/bash

#dump any rest api that arrives to the screen
#anyting echo'd here will be sent in the rest api responce
#anyting sent to > /proc/1/fd/1 will be seen in the docker logs 
echo "####################################################################################################" > /proc/1/fd/1 
echo "scripts/api/subscribers/ingest/match.sh was ran as the webhook url ended in /api/subscribers/ingest/" > /proc/1/fd/1 
echo "Hook information: hook_name=$hook_name, hook_id=$hook_id, hook_method=$hook_method" > /proc/1/fd/1 
echo "Hook information: x_forwarded_for=$x_forwarded_for, x_webauth_user=$x_webauth_user" > /proc/1/fd/1 
echo "Query parameter: Status=$Status" > /proc/1/fd/1 
echo "Header parameter: user-agent=$user_agent" > /proc/1/fd/1 
echo "JSON data block decoded:" > /proc/1/fd/1 
echo "Payload Raw JSON" > /proc/1/fd/1 
echo "$1" > /proc/1/fd/1 
echo "DEBUG: Payload Formatted JSON" > /proc/1/fd/1 
echo "$1" | jq . > /proc/1/fd/1 
echo "####################################################################################################" > /proc/1/fd/1 
echo "$1" | jq . 
