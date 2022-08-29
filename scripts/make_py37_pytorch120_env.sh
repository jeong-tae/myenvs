  
#!/usr/bin/env bash
set -ef -o pipefail

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
CONDA_ENV_NAME=py37_pytorch120
# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

conda create -n ${CONDA_ENV_NAME} python=3.7

conda install -n ${CONDA_ENV_NAME} -y virtualenv cython numpy \
    jupyter jupyterlab matplotlib opencv scikit-learn \
    mkl setuptools pytorch=1.2 torchvision=0.4 wheel -c pytorch

# Install Essential Packages
CONDA_ENV_DIR=$(conda env list | grep "/.*/${CONDA_ENV_NAME}" | awk '{print $2}')

if [[ -z "$CONDA_ENV_DIR" ]]
then
      echo "Fail to find conda env!"
      exit
else
      ${CONDA_ENV_DIR}/bin/pip install pipenv pandas
fi
