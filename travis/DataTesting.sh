#!/usr/bin/env bash

version="$(date +%Y.%m).${TRAVIS_BUILD_NUMBER}"

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

while true
do
case $TRAVIS_JOB_NAME in

	"Testing: adult.hosts.list")
 export testFile="https://raw.githubusercontent.com/${TRAVIS_REPO_SLUG}/${TRAVIS_BRANCH}/submit_here/adult.mypdns.cloud/hosts.list"
 RunPyFunceble
 break
 ;;

	"Testing: adult.mobile.list")
 export testFile="https://raw.githubusercontent.com/${TRAVIS_REPO_SLUG}/${TRAVIS_BRANCH}/submit_here/adult.mypdns.cloud/mobile.list"
 RunPyFunceble
 break
 ;;

	"Testing: adult.rpz-ip")
 export testFile="https://raw.githubusercontent.com/${TRAVIS_REPO_SLUG}/${TRAVIS_BRANCH}/submit_here/adult.mypdns.cloud/domains.list"
 RunPyFunceble
 break
 ;;

	"Testing: adult.snuff.list")
 export testFile="https://raw.githubusercontent.com/${TRAVIS_REPO_SLUG}/${TRAVIS_BRANCH}/submit_here/adult.mypdns.cloud/snuff.list"
 RunPyFunceble
 break
 ;;

	"Testing: adult.white.list")
 export testFile="https://raw.githubusercontent.com/${TRAVIS_REPO_SLUG}/${TRAVIS_BRANCH}/submit_here/adult.mypdns.cloud/white.list"
 RunPyFunceble
 break
 ;;

	"Testing: adult.wildcard.list")
 export testFile="https://raw.githubusercontent.com/${TRAVIS_REPO_SLUG}/${TRAVIS_BRANCH}/submit_here/adult.mypdns.cloud/wildcard.list"
 RunPyFunceble
 break
 ;;

	"Testing: adult.wildcard.rpz-nsdname")
 export testFile="https://raw.githubusercontent.com/${TRAVIS_REPO_SLUG}/${TRAVIS_BRANCH}/submit_here/adult.mypdns.cloud/wildcard.rpz-nsdname"
 RunPyFunceble
 break
 ;;

	"Testing: strict.domains.list")
 export testFile="https://raw.githubusercontent.com/${TRAVIS_REPO_SLUG}/${TRAVIS_BRANCH}/submit_here/strict.adult.mypdns.cloud/domains.list"
 RunPyFunceble
 break
 ;;

	"Testing: strict.hosts.list")
 export testFile="https://raw.githubusercontent.com/${TRAVIS_REPO_SLUG}/${TRAVIS_BRANCH}/submit_here/strict.adult.mypdns.cloud/hosts.list"
 RunPyFunceble
 break
 ;;

	"Testing: strict.rpz-ip")
 export testFile="https://raw.githubusercontent.com/${TRAVIS_REPO_SLUG}/${TRAVIS_BRANCH}/submit_here/strict.adult.mypdns.cloud/rpz-ip"
 RunPyFunceble
 break
 ;;

	"Testing: strict.white.list")
 export testFile="https://raw.githubusercontent.com/${TRAVIS_REPO_SLUG}/${TRAVIS_BRANCH}/submit_here/strict.adult.mypdns.cloud/white.list"
 RunPyFunceble
 break
 ;;

	"Testing: strict.wildcard.list")
 export testFile="https://raw.githubusercontent.com/${TRAVIS_REPO_SLUG}/${TRAVIS_BRANCH}/submit_here/strict.adult.mypdns.cloud/wildcard.list"
 RunPyFunceble
 break
 ;;

	"Testing: strict.wildcard.rpz-nsdname")
 export testFile="https://raw.githubusercontent.com/${TRAVIS_REPO_SLUG}/${TRAVIS_BRANCH}/submit_here/strict.adult.mypdns.cloud/wildcard.rpz-nsdname"
 RunPyFunceble
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
