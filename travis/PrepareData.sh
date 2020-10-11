#!/usr/bin/env bash

# We use git dir to make it CI independent
git_dir="$(git rev-parse --show-toplevel)"

adult_dir="submit_here/adult.mypdns.cloud"
strict_dir="submit_here/strict.adult.mypdns.cloud"

domains="${git_dir}/${adult_dir}/domains.list"
hosts="${git_dir}/${adult_dir}/hosts.list"
mobile="${git_dir}/${adult_dir}/mobile.list"
rpzIp="${git_dir}/${adult_dir}/rpz-ip"
snuff="${git_dir}/${adult_dir}/snuff.list"
wildcard="${git_dir}/${adult_dir}/wildcard.list"
rpzNsdname="${git_dir}/${adult_dir}/wildcard.rpz-nsdname"

strict_adult="${git_dir}/${strict_dir}/wildcard.list"

testFile="${git_dir}/.pyfunceble/domains.txt"

# This following should be replaced by a local whitelist

WhiteList="${git_dir}/submit_here/whitelist.list"

# When this feature request have been merged we can skip this script block
# https://github.com/Ultimate-Hosts-Blacklist/whitelist/issues/150

#getWhiteList () {
#    wget -qO- 'https://raw.githubusercontent.com/mypdns/matrix/master/source/whitelist/domains.list' \
#    | awk '{ printf("%s\n",tolower($1)) }' >> "${WhiteList}"
#    wget -qO- 'https://raw.githubusercontent.com/mypdns/matrix/master/source/whitelist/wildcard.list' \
#    | awk '{ printf("ALL %s\n",tolower($1)) }' >> "${WhiteList}"
#    sort -u -f "${WhiteList}" -o "${WhiteList}"
#}
#getWhiteList

# **************************************************************
# Prepare test file for dns-test repo's
# We do not do a lot more to this file as it will become a
# python file for it's next release
# **************************************************************

PrepareLists () {

    mkdir -p "${git_dir}/.pyfunceble/"

    cat "${domains}" >> "${testFile}"
    sort -u -f "${domains}" -o "${domains}"

    cat "${mobile}" >> "${testFile}"
    sort -u -f "${mobile}" -o "${mobile}"

    cat "${rpzIp}" >> "${testFile}"
    sort -u -f "${rpzIp}" -o "${rpzIp}"

    cat "${strict_adult}" >> "${testFile}"
    sort -u -f "${strict_adult}" -o "${strict_adult}"

    cat "${wildcard}" >> "${testFile}"
    sort -u -f "${wildcard}" -o "${wildcard}"

    cat "${rpzNsdname}" >> "${testFile}"
    sort -u -f "${rpzNsdname}" -o "${rpzNsdname}"

    cat "${snuff}" >> "${testFile}"
    sort -u -f "${snuff}" -o "${snuff}"

    cat "${hosts}" >> "${testFile}"
    sort -u -f "${hosts}" -o "${hosts}"

    sort -u -f "${testFile}" -o "${testFile}"

}
PrepareLists

head "${testFile}"

# ***********************************
# Deletion of all whitelisted domains
# ***********************************

WhiteListing () {
if [[ "$(git log -1 | tail -1 | xargs)" =~ "ci skip" ]]
then
    echo "Running WhiteListing"
    hash uhb_whitelist
    mv "${testFile}" "${testFile}.tmp.txt"
    uhb_whitelist -wc -m -w ${WhiteList} \
      -w 'https://raw.githubusercontent.com/mypdns/matrix/master/source/whitelist/domains.list' \
      --all 'https://raw.githubusercontent.com/mypdns/matrix/master/source/whitelist/wildcard.list'
      -f "${testfile}" -o "${testFile}"
fi
}
WhiteListing

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
# issue at https://github.com/mypdns/matrix/issues
