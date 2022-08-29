  
#!/usr/bin/env bash

#sudo rm /usr/local/cuda # WARNING: it should be symbolic link!!!!
#sudo ln -s ~/users/local/cuda-10.1/ /usr/local/cuda # change symbolic link

set -ef -o pipefail

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
CONDA_ENV_NAME=py36_pytorch150
# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

conda create -n ${CONDA_ENV_NAME} python=3.6

conda install -n ${CONDA_ENV_NAME} -y virtualenv cython numpy \
    jupyter jupyterlab matplotlib opencv scikit-learn \
    mkl setuptools pytorch=1.5 torchvision=0.6.1 wheel -c pytorch

# Install Essential Packages
CONDA_ENV_DIR=$(conda env list | grep "/.*/${CONDA_ENV_NAME}" | awk '{print $2}')

if [[ -z "$CONDA_ENV_DIR" ]]
then
      echo "Fail to find conda env!"
      exit
else
      ${CONDA_ENV_DIR}/bin/pip install awscli dvc[s3] pipenv torchserve torch-model-archiver pandas
fi
