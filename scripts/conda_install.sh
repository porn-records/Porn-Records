#!/usr/bin/env bash

# We use git dir to make it CI independent
git_dir="$(git rev-parse --show-toplevel)"

echo "..."
echo "Let's install conda to prevent MicroShit"
echo "Interfering to much with linux"
echo ""
echo "Any surprises that Microsoft brakes everything they haven't stolen!!"
echo "..."
echo ""

export PATH="${git_dir}/miniconda/bin:${PATH}"
wget 'https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh' -O 'miniconda.sh'
bash miniconda.sh -b -p "${git_dir}/miniconda"
hash -r

source "${git_dir}/miniconda/etc/profile.d/conda.sh"

conda config --set always_yes yes --set changeps1 no
conda config --add channels conda-forge
conda update -q conda
conda create -q -n test-environment python="3.9.1"
source activate test-environment

echo "List conda env"
conda env list

python --version --version
pip --version
conda --version
