#!/bin/bash

#dump any rest api that arrives to the screen
#the output goes to file /tmp/gazoo-commands/message-decode
#to watch it on the host "tail -f /tmp/gazoo-commands/message-decode"

echo "DEBUG: default.sh was ran as the webhook url ended in a /" >> /tmp/gazoo-commands/message-decode
echo "DEBUG: Hook information: hook_name=$hook_name, hook_id=$hook_id, hook_method=$hook_method" >> /tmp/gazoo-commands/message-decode
echo "DEBUG: Hook information: x_forwarded_for=$x_forwarded_for, x_webauth_user=$x_webauth_user" >> /tmp/gazoo-commands/message-decode
echo "DEBUG: Query parameter: Status=$Status" >> /tmp/gazoo-commands/message-decode
echo "DEBUG: Header parameter: user-agent=$user_agent" >> /tmp/gazoo-commands/message-decode
echo "DEBUG: JSON data block decoded:" >> /tmp/gazoo-commands/message-decode
echo "DEBUG: Payload Raw JSON" >> /tmp/gazoo-commands/message-decode
echo "$1" >> /tmp/gazoo-commands/message-decode
echo "DEBUG: Payload Formatted JSON" >> /tmp/gazoo-commands/message-decode
echo "$1" | jq . >> /tmp/gazoo-commands/message-decode

