#!/usr/bin/env bash

export version="$(date +%Y.%m).${BUILD_NUMBER}"

git_dir="$(git rev-parse --show-toplevel)"

adult_dir="${git_dir}/submit_here/adult.mypdns.cloud"
strict_dir="${git_dir}/submit_here/strict.adult.mypdns.cloud"

domains="${adult_dir}/domains.list"
hosts="${adult_dir}/hosts.list"
mobile="${adult_dir}/mobile.list"
rpzIp="${adult_dir}/rpz-ip"
snuff="${adult_dir}/snuff.list"
wildcard="${adult_dir}/wildcard.list"
rpzNsdname="${adult_dir}/wildcard.rpz-nsdname"

strict_domain="${strict_dir}/strict.domains.list"
strict_hosts="${strict_dir}/strict.hosts.list"
strict_rpzIp="${strict_dir}/strict.rpz-ip"
strict_wildcard="${strict_dir}/strict.wildcard.list"
strict_rpzNsdname="${strict_dir}/strict.wildcard.rpz-nsdname"
#testFile="${git_dir}/.pyfunceble/domains.txt"

#testFile="https://raw.githubusercontent.com/${TRAVIS_REPO_SLUG}/.pyfunceble/domains.txt"
#testFile="https://raw.githubusercontent.com/PyFunceble/ci_test/master/test.list"

export PYFUNCEBLE_AUTO_CONFIGURATION=YES
export PYFUNCEBLE_DEBUG=True
export PYFUNCEBLE_DEBUG_LVL=critical
export PYFUNCEBLE_CONFIG_DIR="${git_dir}/.pyfunceble"
export PYFUNCEBLE_OUTPUT_LOCATION="${git_dir}/active_domains/"

hash pyfunceble

printf "\n\tYou are running with RunFunceble\n\n"

pyfunceble --ci \
  -a \
  --preload \
  -ex \
  --hierarchical \
  --ci-max-minutes 320 \
  -f "${domains}" \
  "${hosts}" \
  "${mobile}" \
  "${rpzIp}" \
  "${snuff}" \
  "${wildcard}" \
  "${rpzNsdname}" \
  "${strict_domain}" \
  "${strict_hosts}" \
  "${strict_rpzIp}" \
  "${strict_wildcard}" \
  "${strict_rpzNsdname}" #\
  #--http
  #--ci-command "git add ${PYFUNCEBLE_OUTPUT_LOCATION} && git pull --rebase"


exit ${?}

# Copyright: https://www.mypdns.org/
# Content: https://www.mypdns.org/p/Spirillen/
# Source: https://www.mypdns.org/source/PornRecords/
# License: https://www.mypdns.org/w/license
# License Comment: GNU AGPLv3, MODIFIED FOR NON COMMERCIAL USE
#
# License in short:
# You are free to copy and distribute this file for non-commercial uses,
# as long the original URL and attribution is included.
#
# Please forward any additions, corrections or comments by logging an
# issue at https://www.mypdns.org/maniphest/
