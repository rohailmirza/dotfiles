#!/bin/bash

searchfor=$( echo "                                    Google search query" | dmenu )
searchfor=${searchfor// /%20}
link="https://www.google.com/search?q=$searchfor"
firefox --private-window $link
