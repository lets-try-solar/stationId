#!/bin/bash
#######################################
#                                     #
#          Lets-try-Solar             #
#                                     #
#   Author: hemmi@lets-try-solar.de   #
#                                     #
#######################################

scriptpath="$( cd "$(dirname "$0")" ; pwd -P )"
username="EMAIL-ADDRESS"
password="PASSWORD"

wget -qO- -o /dev/null --keep-session-cookies --save-cookies ${scriptpath}/cookies.txt --post-data "username=${username}&pwd=${password}" https://www.envertecportal.com/apiaccount/login > /dev/null 2>&1
wget -q --load-cookies ${scriptpath}/cookies.txt 'https://www.envertecportal.com/terminal/systemoverview' -O ${scriptpath}/systemoverview > /dev/null 2>&1

stationId=`grep "var stationId = '" ${scriptpath}/systemoverview | awk '{print $4}' | sed "s/'//g" | sed "s/;//g"`
echo "StationId: ${stationId}"
rm "${scriptpath}/systemoverview"
