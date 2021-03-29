FROM pytorch/pytorch:1.7.1-cuda11.0-cudnn8-devel

# https://github.com/facebookresearch/pytorch3d/blob/master/INSTALL.md
RUN /opt/conda/bin/conda install -c conda-forge -c fvcore -c iopath fvcore iopath && \
    /opt/conda/bin/conda install -c bottler nvidiacub && \
    /opt/conda/bin/conda install jupyter && \
    /opt/conda/bin/pip install scikit-image matplotlib imageio plotly opencv-python && \
    /opt/conda/bin/pip install black 'isort<5' flake8 flake8-bugbear flake8-comprehensions && \
    /opt/conda/bin/conda install pytorch3d -c pytorch3d

RUN apt update -y && \
    apt install -y zsh git tig tmux vim && \
    apt install -y wget curl && \
    apt install -y jq zip unzip && \
    rm -rf /var/lib/apt/lists/*

RUN /opt/conda/bin/pip install --upgrade pip && \
    /opt/conda/bin/pip install scikit-learn -U meshio h5py && \
    /opt/conda/bin/pip install "git+https://github.com/erikwijmans/Pointnet2_PyTorch.git#egg=pointnet2_ops&subdirectory=pointnet2_ops_lib"

CMD tmux
