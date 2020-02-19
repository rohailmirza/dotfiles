#!/bin/bash

searchfor=$( echo "                                    Type Jira search query" | dmenu )
searchfor=${searchfor// /%20}
link="https://magazino.atlassian.net/issues/?jql=text%20~%20%22$searchfor%22"
firefox $link
