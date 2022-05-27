#!/bin/bash

_getLinuxDistrib()
{
	cat /etc/*-release | grep DISTRIB_DESCRIPTION | awk -F '\"' '{print $2}'
}

_getJavaVersion()
{
	java -version 2>&1 | head -n 1 | awk -F '"' '{print $2}'
}

####################################
# MAIN
# Constructs tabs for various information
####################################
main()
{
  	cat <<EOF
{
 "icon": "fa fa-linux", 
  "subgroups": 
  [
  	{
	    "title": "System Infos",
	    "icon": "fa fa-server",
	    "content": 
	    [
	    	{"type": "plain", "icon": "fa fa-linux", "text": "Linux Distrib", "value": "$(_getLinuxDistrib)", "endline": "<br/>"},
	    	{"type": "plain", "icon": "fa fa-info", "text": "Java Version", "value": "$(_getJavaVersion)", "endline": "<br/>"}
		    
	    ]
	}	
  ]
}
EOF
}
####################################
 
main "$@"
