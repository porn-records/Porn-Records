#!/usr/bin/env bash

# We use git dir to make it CI independent
git_dir="$(git rev-parse --show-toplevel)"

hosts="${git_dir}/submit_here/hosts.list"
snuff="${git_dir}/submit_here/snuff.list"
domains="${git_dir}/submit_here/domains.list"
mobile="${git_dir}/submit_here/mobile.list"
rpz-ip="${git_dir}/submit_here/rpz-ip"
strict_adult="${git_dir}/submit_here/strict_adult.list"
wildcard="${git_dir}/submit_here/wildcard.list"
rpz-nsdname="${git_dir}/submit_here/wildcard.rpz-nsdname"

testFile="${git_dir}/.pyfunceble/domains.txt"

# This following should be replaced by a local whitelist

WhiteList="${git_dir}/submit_here/whitelist.list"

# When this feature request have been merged we can skip this script block
# https://github.com/Ultimate-Hosts-Blacklist/whitelist/issues/150

getWhiteList () {
    wget -qO- 'https://raw.githubusercontent.com/mypdns/matrix/master/source/whitelist/domains.list' \
    | awk '{ printf("%s\n",tolower($1)) }' >> "${WhiteList}"
    wget -qO- 'https://raw.githubusercontent.com/mypdns/matrix/master/source/whitelist/wildcard.list' \
    | awk '{ printf("ALL %s\n",tolower($1)) }' >> "${WhiteList}"
    sort -u -f "${WhiteList}" -o "${WhiteList}"
}
getWhiteList

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

    cat "${rpz-ip}" >> "${testFile}"
    sort -u -f "${rpz-ip}" -o "${rpz-ip}"

    cat "${strict_adult}" >> "${testFile}"
    sort -u -f "${strict_adult}" -o "${strict_adult}"

    cat "${wildcard}" >> "${testFile}"
    sort -u -f "${wildcard}" -o "${wildcard}"

    cat "${rpz-nsdname}" >> "${testFile}"
    sort -u -f "${rpz-nsdname}" -o "${rpz-nsdname}"

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
    hash uhb_whitelist
    mv "${testFile}" "${testFile}.tmp.txt"
    uhb_whitelist -wc -m -w "${WhiteList}" -f "${testfile}.tmp.txt" \
      -o "${testFile}"
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
