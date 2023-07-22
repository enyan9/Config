#!/bin/bash

HOM=${1:-"$HOME"}
# if [[ -z "$1" ]]
# then
# 	HOM="$HOME"
# else
# 	HOM="$1"
# fi

#sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#sudo mkdir -p /opt/miniconda3 && sudo chown "$USER" /opt/miniconda3
#wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -P "$HOM" && chmod 755 "$HOM"/Miniconda3-latest-Linux-x86_64.sh && "$HOM"/Miniconda3-latest-Linux-x86_64.sh -u
#/opt/miniconda3/bin/conda init zsh


#Archived installs
# #conda install python=3.8 jupyter scipy numpy matplotlib pandas geopandas scikit-learn scikit-image shapely jupyterlab h5py nb_conda
# #conda install -c conda-forge python=3.8 jupyter scipy numpy matplotlib pandas geopandas scikit-learn scikit-image shapely jupyterlab h5py nb_conda numpy-financial nodejs imagemagick av

# #conda install pytorch torchvision torchaudio cudatoolkit=10.2 -c pytorch
# #conda install pytorch torchvision torchaudio cpuonly -c pytorch

# #conda install -c conda-forge python=3.8 jupyter scipy numpy matplotlib pandas geopandas scikit-learn scikit-image shapely jupyterlab h5py nb_conda numpy-financial nodejs imagemagick av pytorch torchvision torchaudio cudatoolkit=10.2 -c pytorch

# #conda create -n gpu -c conda-forge python=3.10 jupyter scipy numpy matplotlib pandas geopandas scikit-learn scikit-image shapely jupyterlab h5py nb_conda numpy-financial nodejs imagemagick av gdb pytorch torchvision torchaudio cudatoolkit=11.3 -c pytorch
# #pip install opencv-python

# #conda create -n jup -c conda-forge python=3.10 jupyter qtconsole
# #pip install jupyter-client==6.1.12

# #conda install -c conda-forge zsh git tmux ranger-fm imagemagick

#---

#linux
#conda install python=3.11 jupyter jupyterlab nodejs qtconsole requests lxml numpy scipy matplotlib pandas scikit-learn scikit-image shapely opencv h5py nb_conda
#pip install numpy-financial geopandas av

#base ml
#conda install jupyterlab nodejs requests lxml numpy scipy matplotlib pandas scikit-learn h5py nb_conda

#jup

mkdir -p "$HOM"/.jupyter # jupyter qtconsole --generate-config
mkdir -p "$HOM"/.ipython/profile_default # ipython profile create #default
cp app/jupyter/.condarc "$HOM"/.condarc
cp app/jupyter/jupyter_qtconsole_config.py "$HOM"/.jupyter/
cp app/jupyter/jupyter_lab_config.py "$HOM"/.jupyter/
cp app/jupyter/ipython_config.py "$HOM"/.ipython/profile_default/