#!/bin/bash

#dump any rest api that arrives to the screen
#the output goes to file /tmp/giggerota/message-decode
#to watch it on the host "tail -f /tmp/giggerota/message-decode"

echo "DEBUG: default.sh was ran as the webhook url ended in a /" >> /tmp/giggerota/message-decode
echo "DEBUG: Hook information: hook_name=$hook_name, hook_id=$hook_id, hook_method=$hook_method" >> /tmp/giggerota/message-decode
echo "DEBUG: Hook information: x_forwarded_for=$x_forwarded_for, x_webauth_user=$x_webauth_user" >> /tmp/giggerota/message-decode
echo "DEBUG: Query parameter: Status=$Status" >> /tmp/giggerota/message-decode
echo "DEBUG: Header parameter: user-agent=$user_agent" >> /tmp/giggerota/message-decode
echo "DEBUG: JSON data block decoded:" >> /tmp/giggerota/message-decode
echo "DEBUG: Payload Raw JSON" >> /tmp/giggerota/message-decode
echo "$1" >> /tmp/giggerota/message-decode
echo "DEBUG: Payload Formatted JSON" >> /tmp/giggerota/message-decode
echo "$1" | jq . >> /tmp/giggerota/message-decode

