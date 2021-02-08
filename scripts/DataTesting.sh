#!/usr/bin/env bash

version="$(date +%Y.%m).${BUILD_NUMBER}"

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

strict_domain="${strict_dir}/domains.list"
strict_hosts="${strict_dir}/hosts.list"
strict_rpzIp="${strict_dir}/rpz-ip"
strict_wildcard="${strict_dir}/wildcard.list"
strict_rpzNsdname="${strict_dir}/wildcard.rpz-nsdname"
#testFile="${git_dir}/.pyfunceble/domains.txt"

#testFile="https://raw.githubusercontent.com/${TRAVIS_REPO_SLUG}/.pyfunceble/domains.txt"
#testFile="https://raw.githubusercontent.com/PyFunceble/ci_test/master/test.list"

export PYFUNCEBLE_CONFIG_DIR="${git_dir}/.pyfunceble"
export PYFUNCEBLE_OUTPUT_LOCATION="${git_dir}/active_domains/"

hash pyfunceble

printf "\n\tYou are running with RunFunceble\n\n"

pyfunceble --ci \
  -a \
  -ex \
  --hierarchical \
  --autosave-minutes 25 \
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
  "${strict_rpzNsdname}"


exit ${?}

# Copyright: https://www.mypdns.org/
# Content: https://www.mypdns.org/p/Spirillen/
# Source: https://www.mypdns.org/source/PornDomains/
# License: https://www.mypdns.org/w/license
# License Comment: GNU AGPLv3, MODIFIED FOR NON COMMERCIAL USE
#
# License in short:
# You are free to copy and distribute this file for non-commercial uses,
# as long the original URL and attribution is included.
#
# Please forward any additions, corrections or comments by logging an
# issue at https://www.mypdns.org/maniphest/
