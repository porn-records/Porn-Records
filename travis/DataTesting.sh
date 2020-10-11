#!/usr/bin/env bash

version="$(date +%Y.%m).${TRAVIS_BUILD_NUMBER}"

testFile="${git_dir}/.pyfunceble/domains.txt"

#testFile="https://raw.githubusercontent.com/${TRAVIS_REPO_SLUG}/.pyfunceble/domains.txt"
#testFile="https://raw.githubusercontent.com/PyFunceble/ci_test/master/test.list"

RunPyFunceble () {

    hash pyfunceble

    printf "\n\tYou are running with RunFunceble\n\n"

    pyfunceble --ci -q -h -ex --plain --dns 127.0.0.1:5300 --hierarchical \
      -db --database-type mariadb --share-logs --http --idna --dots \
      --autosave-minutes 15 --ci-branch "${TRAVIS_BRANCH}" \
      --ci-distribution-branch "${TRAVIS_BRANCH}" \
      --commit-autosave-message "${version} [Auto Saved]" \
      --commit-results-message "${version}" \
      -f "${testFile}"

}

printf "\n\tTravis reposlug is:\n\t%s\n\t" "${TRAVIS_REPO_SLUG}"

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
