  
#!/usr/bin/env bash

#sudo rm /usr/local/cuda # WARNING: it should be symbolic link!!!!
#sudo ln -s ~/users/local/cuda-10.1/ /usr/local/cuda # change symbolic link

set -ef -o pipefail

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
CONDA_ENV_NAME=SWINTS
# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

conda create -n ${CONDA_ENV_NAME} python=3.8 -y

conda install -n ${CONDA_ENV_NAME} -y virtualenv cython numpy \
    jupyter jupyterlab matplotlib scikit-learn \
    pytorch==1.8.0 torchvision==0.9.0 torchaudio==0.8.0 cudatoolkit=11.1 -c pytorch -c nvidia -c conda-forge

# Install Essential Packages
CONDA_ENV_DIR=$(conda env list | grep "/.*/${CONDA_ENV_NAME}" | awk '{print $2}')

if [[ -z "$CONDA_ENV_DIR" ]]
then
      echo "Fail to find conda env!"
      exit
else
      ${CONDA_ENV_DIR}/bin/pip install pipenv opencv-python scipy shapely rapidfuzz timm Polygon3
fi
