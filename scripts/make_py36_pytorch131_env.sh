  
#!/usr/bin/env bash
set -ef -o pipefail

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
CONDA_ENV_NAME=py36_pytorch131
# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

conda create -n ${CONDA_ENV_NAME} python=3.6

conda install -n ${CONDA_ENV_NAME} -y virtualenv cython=0.29.12 numpy=1.16.4 \
    jupyter jupyterlab matplotlib=3.1.1 opencv \
    mkl setuptools pytorch=1.3.1 torchvision=0.4 -c pytorch

# Install Essential Packages
CONDA_ENV_DIR=$(conda env list | grep "/.*/${CONDA_ENV_NAME}" | awk '{print $2}')

if [[ -z "$CONDA_ENV_DIR" ]]
then
      echo "Fail to find conda env!"
      exit
else
      ${CONDA_ENV_DIR}/bin/pip install awscli dvc[s3] pipenv
fi
