#!/usr/bin/env bash

# We use git dir to make it CI independent
GIT_DIR="$(git rev-parse --show-toplevel)"

echo "..."
echo "Let's install conda to prevent MicroShit"
echo "Interfering to much with linux"
echo ""
echo "Any surprises that Microsoft brakes everything they haven't stolen??"
echo "..."
echo ""

export PATH="${GIT_DIR}/miniconda/bin:${PATH}"
# wget 'https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh' -O 'miniconda.sh'
curl 'https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh' -o 'miniconda.sh'
bash miniconda.sh -b -p "${GIT_DIR}/miniconda"
hash -r

source "${GIT_DIR}/miniconda/etc/profile.d/conda.sh"

conda config --set always_yes yes --set changeps1 no
conda config --add channels conda-forge
conda update -q conda
conda create -q -n pyfunceble python="3.10"
conda activate pyfunceble

echo "Conda env list:"
conda env list

python --version --version
pip --version
conda --version

# Copyright: https://mypdns.org/
# Content: https://mypdns.org/spirillen/
# Source: https://mypdns.org/my-privacy-dns/porn-records
# License: https://mypdns.org/my-privacy-dns/porn-records/-/blob/master/LICENSE
# License: Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
#
# You should have received a copy of the license along with this
# work.
