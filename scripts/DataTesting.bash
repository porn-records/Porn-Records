#!/usr/bin/env bash

# export version="$(date +%Y.%m).${BUILD_NUMBER}"

GIT_DIR="$(git rev-parse --show-toplevel)"

POL_LIBRARY="/tmp/pornRecords/"

ADULT_DIR="${GIT_DIR}/submit_here/adult.mypdns.cloud"
IMPORT_LIBRARY="${GIT_DIR}/submit_here/imported"
STRICT_DIR="${GIT_DIR}/submit_here/strict.adult.mypdns.cloud"

DOMAINS="${ADULT_DIR}/domains.list"
HOSTS="${ADULT_DIR}/hosts.list"
MOBILE="${ADULT_DIR}/mobile.list"
RPZIP="${ADULT_DIR}/rpz-ip"
SNUFF="${ADULT_DIR}/snuff.list"
WILDCARD="${ADULT_DIR}/wildcard.list"
RPZNSDNAME="${ADULT_DIR}/wildcard.rpz-nsdname"

IMP_SW="$IMPORT_LIBRARY/adult.ShadowWhisperer"
IMP_DOMAINS="$IMPORT_LIBRARY/domains.matrix"
IMP_HOSTS="$IMPORT_LIBRARY/hosts.clefspeare13"
IMP_MOBILE="$IMPORT_LIBRARY/mobile.clefspeare13"
IMP_PHIES="$IMPORT_LIBRARY/pornhosts.import-external-sources"
IMP_STRICT="$IMPORT_LIBRARY/strict_adult.clefspeare13"

STRICT_DOMAIN="${STRICT_DIR}/strict.domains.list"
STRICT_HOSTS="${STRICT_DIR}/strict.hosts.list"
STRICT_RPZIP="${STRICT_DIR}/strict.rpz-ip"
STRICT_WILDCARD="${STRICT_DIR}/strict.wildcard.list"
STRICT_RPZNSDNAME="${STRICT_DIR}/strict.wildcard.rpz-nsdname"

# For testing
# testFile="https://raw.githubusercontent.com/${TRAVIS_REPO_SLUG}/.pyfunceble/domains.txt"
# testFile="https://raw.githubusercontent.com/PyFunceble/ci_test/master/test.list"

# Install / update conda
# Set conda install dir
condaInstallDir="${HOME}/miniconda"

# Get the conda CLI.
source "${condaInstallDir}/etc/profile.d/conda.sh"

hash conda

# First Update Conda
conda update -yq conda
conda env remove -n pyfunceble
conda env update -n pyfunceble -f "${GIT_DIR}/.environment.yaml" --prune
# conda create -q -n pyfunceble python="3.10"
conda activate pyfunceble

# pip install -U -I pyfunceble>=4.0.1
# pip install -U -I --pre pyfunceble-dev>=4.0.2b1
# pip install -U -I mypdns

export PYFUNCEBLE_AUTO_CONFIGURATION=YES
export PYFUNCEBLE_DEBUG=True
export PYFUNCEBLE_DEBUG_LVL=critical


hash pyfunceble

pyfunceble --version

printf "\n\tYou are running with Pyfunceble\n\n"

function pyf_basic () {
	export PYFUNCEBLE_CONFIG_DIR="${HOME}/.config/PyFunceble/"
	export PYFUNCEBLE_OUTPUT_LOCATION="${POL_LIBRARY}"

	if [ ! -d "${POL_LIBRARY}" ]
	then
		mkdir -p "${POL_LIBRARY}"
		mount "${POL_LIBRARY}"
	else
		rm -fr "${POL_LIBRARY}/*"
		umount "${POL_LIBRARY}"
		mkdir -p "${POL_LIBRARY}"
		mount "${POL_LIBRARY}"
	fi

	cd "${POL_LIBRARY}"

	rsync -avPq --exclude rpz.mypdns.cloud/ \
		--delete-before "${GIT_DIR}/active_domains/" "${POL_LIBRARY}/"
	
	pyfunceble -w 40 \
		--database-type csv \
		-f "${DOMAINS}" \
		--dns 192.168.1.6 9.9.9.10 \
		"${HOSTS}" \
		"${MOBILE}" \
		"${RPZIP}" \
		"${SNUFF}" \
		"${WILDCARD}" \
		"${RPZNSDNAME}" \
		"${IMP_SW}" \
		"${IMP_DOMAINS}" \
		"${IMP_HOSTS}" \
		"${IMP_MOBILE}" \
		"${IMP_PHIES}" \
		"${IMP_STRICT}" \
		"${STRICT_DOMAIN}" \
		"${STRICT_HOSTS}" \
		"${STRICT_RPZIP}" \
		"${STRICT_WILDCARD}" \
		"${STRICT_RPZNSDNAME}"

# --dns 192.168.1.6 9.9.9.10 \
	cd "$GIT_DIR"

	rsync -avPq "${POL_LIBRARY}/" "${GIT_DIR}/active_domains/"
}

function pyf_ci () {
  # commands for CI/CD
  export PYFUNCEBLE_CONFIG_DIR="${GIT_DIR}/.pyfunceble"
  export PYFUNCEBLE_OUTPUT_LOCATION="${GIT_DIR}/active_domains/"
  pyf_basic --ci --ci-max-minutes 45 --dots -q
}


# Setup a option to run the same script, both in CI and locally.
if [ "$1" == "-ci" ]
then
  pyf_ci
else
  pyf_basic
fi

conda deactivate
conda env remove -n pyfunceble

umount "${POL_LIBRARY}/"

git commit -am "Latest availability test with @pyfunceble" # && git push

exit ${?}

# Copyright: https://mypdns.org/
# Content: https://mypdns.org/spirillen/
# Source: https://mypdns.org/my-privacy-dns/porn-records
# License: https://mypdns.org/my-privacy-dns/porn-records/-/blob/master/LICENSE
# License: Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
#
# You should have received a copy of the license along with this
# work.
#
# Please forward any additions, corrections or comments by logging an
# issue at https://mypdns.org/my-privacy-dns/porn-records/-/issues
