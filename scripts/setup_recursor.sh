#!/usr/bin/env bash

# Copyright: https://mypdns.org/
# Content: https://mypdns.org/spirillen/
# Source: https://mypdns.org/my-privacy-dns/porn-records
# License: https://mypdns.org/my-privacy-dns/porn-records/-/blob/master/LICENSE
# License: Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
#
# You should have received a copy of the license along with this
# work.
#
# License in short:
# You are free to copy and distribute this file for non-commercial uses,
# as long the original URL and attribution is included.
#
# Please forward any additions, corrections or comments by logging an
# issue at https://mypdns.org/my-privacy-dns/porn-records/-/issues

set -e

# As the TRAVIS_BUILD_DIR no longer seems to be working. I'm changing
# that to git_dir
git_dir="$(git rev-parse --show-toplevel)"

printf "deb [arch=amd64] http://repo.powerdns.com/ubuntu %s-rec-master main\n" \
  "$(lsb_release -cs)" > "/etc/apt/sources.list.d/pdns.list"

printf "Package: pdns-*\nPin: origin repo.powerdns.com\nPin-Priority: 600" > \
  "/etc/apt/preferences.d/pdns"

curl "https://repo.powerdns.com/CBC8B383-pub.asc" | sudo apt-key add - && \
  sudo apt-get update -q && \
  sudo apt-get install -q pdns-recursor ldnsutils

# Lets get rit of known deadbeats by loading the Response policy zone
# for known pirated domains

cp "${git_dir}/dev-tools/recursor.lua" "/etc/powerdns/recursor.lua"

# Since this systemd-resolved kill script also killed Travis we most change
# the default port of the recursor.... fuck!!!!!

sed -i "/local-address/d" "/etc/powerdns/recursor.conf"

printf "local-address=0.0.0.0\nlocal-port=5300\n" >> "/etc/powerdns/recursor.conf"

systemctl restart pdns-recursor.service

# Let the recursor load the RPZ zone before testing it
sleep 5

# Check if the recursor is listening to port on port 5300
if lsof -i :5300 | grep -q '^pdns_'
then
	printf "\n\tThe recursor is running on port 5300
	We carry on with our test procedure"
else
	printf "\n\tRecursor not running, We stops here\n"
	exit 1
fi

if drill 21x.org @127.0.0.1 -p 5300 | grep -qi "NXDOMAIN"
then
	printf "\n\tPirated domains Response policy zone My Privacy DNS is loaded... Good\n\n"
else
	printf "\t\nResponse policy zone not loaded, we are done for this time\n\n"
	exit 1
fi

exit ${?}


# This program is free software: you can redistribute it and/or modify
# it under the terms of the modified GNU Affero General Public License as
# published by the My Privacy DNS, either version 3 of the
# License, or any later version released at
# https://mypdns.org/my-privacy-dns/porn-records/-/blob/master/LICENSE.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# modified GNU Affero General Public License for more details.

# You should have received a copy of the modified GNU Affero General Public License
# along with this program. If not, see https://mypdns.org/my-privacy-dns/porn-records/-/blob/master/LICENSE.

# The modification: The standard AGPLv3 have been altered to NOT allow
# any to generate profit from our work. You are however free to use it to any
# NON PROFIT purpose. If you would like to use any of our code for profiteering
# YOU are obliged to contact https://mypdns.org/ for profit sharing.
