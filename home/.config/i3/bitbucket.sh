#!/bin/bash

searchfor=$( echo "                                    Type Bitbucket search query" | dmenu )
searchfor=${searchfor// /%20}
link="https://bitbucket.org/search?q=$searchfor&account=%7B9031e91f-2b00-49de-91a3-b68a28f8a6fe%7D"
firefox $link
