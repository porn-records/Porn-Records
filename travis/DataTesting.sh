#!/usr/bin/env bash

version="$(date +%Y.%m).${TRAVIS_BUILD_NUMBER}"

testFile="https://raw.githubusercontent.com/${TRAVIS_REPO_SLUG}/.pyfunceble/domains.txt"
#testFile="https://raw.githubusercontent.com/PyFunceble/ci_test/master/test.list"

RunFunceble () {

    hash pyfunceble

    printf "\n\tYou are running with RunFunceble\n\n"

    pyfunceble --ci -q -h -ex --plain --dns 127.0.0.1:5300 --hierarchical \
      -db --database-type mariadb --share-logs --http --idna --dots \
      --autosave-minutes 15 --ci-branch "${TRAVIS_BRANCH}" \
      --ci-distribution-branch "${TRAVIS_BRANCH}" \
      --commit-autosave-message "${version} [Auto Saved]" \
      --commit-results-message "${version}"

}

printf "\n\tTravis reposlug is:\n\t%s\n\t" "${TRAVIS_REPO_SLUG}"

while true
do
case $TRAVIS_JOB_NAME in

	"Testing: adult.hosts.list")
 RunFunceble -f "https://raw.githubusercontent.com/${TRAVIS_REPO_SLUG}/${TRAVIS_BRANCH}/submit_here/adult.mypdns.cloud/hosts.list"
 break
 ;;

	"Testing: adult.mobile.list")
 RunFunceble -f "https://raw.githubusercontent.com/${TRAVIS_REPO_SLUG}/${TRAVIS_BRANCH}/submit_here/adult.mypdns.cloud/mobile.list"
 break
 ;;

	"Testing: adult.rpz-ip")
 RunFunceble -f "https://raw.githubusercontent.com/${TRAVIS_REPO_SLUG}/${TRAVIS_BRANCH}/submit_here/adult.mypdns.cloud/domains.list"
 break
 ;;

	"Testing: adult.snuff.list")
 RunFunceble -f "https://raw.githubusercontent.com/${TRAVIS_REPO_SLUG}/${TRAVIS_BRANCH}/submit_here/adult.mypdns.cloud/snuff.list"
 break
 ;;

	"Testing: adult.white.list")
 RunFunceble -f "https://raw.githubusercontent.com/${TRAVIS_REPO_SLUG}/${TRAVIS_BRANCH}/submit_here/adult.mypdns.cloud/white.list"
 break
 ;;

	"Testing: adult.wildcard.list")
 RunFunceble -f "https://raw.githubusercontent.com/${TRAVIS_REPO_SLUG}/${TRAVIS_BRANCH}/submit_here/adult.mypdns.cloud/wildcard.list"
 break
 ;;

	"Testing: adult.wildcard.rpz-nsdname")
 RunFunceble -f "https://raw.githubusercontent.com/${TRAVIS_REPO_SLUG}/${TRAVIS_BRANCH}/submit_here/adult.mypdns.cloud/wildcard.rpz-nsdname"
 break
 ;;

	"Testing: strict.domains.list")
 RunFunceble -f "https://raw.githubusercontent.com/${TRAVIS_REPO_SLUG}/${TRAVIS_BRANCH}/submit_here/strict.adult.mypdns.cloud/domains.list"
 break
 ;;

	"Testing: strict.hosts.list")
 RunFunceble -f "https://raw.githubusercontent.com/${TRAVIS_REPO_SLUG}/${TRAVIS_BRANCH}/submit_here/strict.adult.mypdns.cloud/hosts.list"
 break
 ;;

	"Testing: strict.rpz-ip")
 RunFunceble -f "https://raw.githubusercontent.com/${TRAVIS_REPO_SLUG}/${TRAVIS_BRANCH}/submit_here/strict.adult.mypdns.cloud/rpz-ip"
 break
 ;;

	"Testing: strict.white.list")
 RunFunceble -f "https://raw.githubusercontent.com/${TRAVIS_REPO_SLUG}/${TRAVIS_BRANCH}/submit_here/strict.adult.mypdns.cloud/white.list"
 break
 ;;

	"Testing: strict.wildcard.list")
 RunFunceble -f "https://raw.githubusercontent.com/${TRAVIS_REPO_SLUG}/${TRAVIS_BRANCH}/submit_here/strict.adult.mypdns.cloud/wildcard.list"
 break
 ;;

	"Testing: strict.wildcard.rpz-nsdname")
 RunFunceble -f "https://raw.githubusercontent.com/${TRAVIS_REPO_SLUG}/${TRAVIS_BRANCH}/submit_here/strict.adult.mypdns.cloud/wildcard.rpz-nsdname"
 break
 ;;

     *)
 echo "Invalid input..."
 ;;
 esac
done


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
