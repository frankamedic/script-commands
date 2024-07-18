#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Create Marvin Task
# @raycast.mode silent

# Optional parameters:
# @raycast.icon images/todoist-logo.png
# @raycast.packageName Todoist
# @raycast.argument1 { "type": "text", "placeholder": "Call Mom Tomorrow at 5" }

# Documentation: 
# @raycast.description Create Task
# @raycast.author Frank Sloan
# @raycast.authorURL https://github.com/frankamedic

# Get your API Token from: https://app.amazingmarvin.com/pre?api

API_TOKEN="APITOKENHERE"

if [ -z "$API_TOKEN" ]; then
	echo "Marvin API token is missing.";
	exit 1;
fi

TASK="$1"

if [[ $TASK != "" ]]; then
    curl "https://serv.amazingmarvin.com/api/AddTask" \
    	-X POST \
    	--data '{"title": "'"$TASK"'"}' \
    	-H "Content-Type: application/json" \
    	-H "Authorization: Bearer $API_TOKEN"

	echo "Task Created" # These tasks will show up in your inbox
else
	echo "Please specify a task"
fi
