#!/usr/bin/env bash

# We use git dir to make it CI independent
git_dir="$(git rev-parse --show-toplevel)"

echo ""
echo "Let's install conda to prevent MicroShit"
echo "Interfering to much with linux"
echo ""

export PATH="${HOME}/miniconda/bin:${PATH}"
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
bash miniconda.sh -b -p ${HOME}/miniconda
hash -r
conda config --set always_yes yes --set changeps1 no
conda config --add channels conda-forge
conda update -q conda
conda create -q -n test-environment python="${PYTHON_VERSION}"
conda activate test-environment
python --version --version
pip --version
conda --version
