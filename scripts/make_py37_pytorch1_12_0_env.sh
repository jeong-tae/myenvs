  
#!/usr/bin/env bash
set -ef -o pipefail

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
CONDA_ENV_NAME=py37_pytorch1_12_0
# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

conda create -n ${CONDA_ENV_NAME} python=3.7

conda install -n ${CONDA_ENV_NAME} -y virtualenv cython numpy \
    jupyter jupyterlab matplotlib opencv scikit-learn \
    mkl setuptools torchaudio pytorch=1.12 torchvision==0.13.0 wheel cudatoolkit=10.2 -c pytorch

# Install Essential Packages
CONDA_ENV_DIR=$(conda env list | grep "/.*/${CONDA_ENV_NAME}" | awk '{print $2}')

if [[ -z "$CONDA_ENV_DIR" ]]
then
      echo "Fail to find conda env!"
      exit
else
      ${CONDA_ENV_DIR}/bin/pip install pipenv pandas Polygon3 tqdm tensorflow-cpu shapely pyclipper torch-summary
fi
