#!/usr/bin/env bash
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
CONDA_ENV_NAME=py36_pytorch150
# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

PYTHON_ENV_DIR=$(conda env list | grep "/.*/${CONDA_ENV_NAME}" | awk '{print $2}')
if [[ -z "${PYTHON_ENV_DIR}" ]]
then
      echo "Fail to find ${CONDA_ENV_NAME} conda env!"
      exit
fi

export PATH=${PYTHON_ENV_DIR}/bin:$PATH
export LD_LIBRARY_PATH=${PYTHON_ENV_DIR}/lib
