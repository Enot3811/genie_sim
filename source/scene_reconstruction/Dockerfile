ARG CUDA_IMAGE="12.4.1-cudnn-devel-ubuntu22.04"
FROM nvidia/cuda:${CUDA_IMAGE} AS system-builder

ARG TORCH_ARCH="8.9+PTX"
ARG PT_CU_VER="cu124"

ENV ACCEPT_EULA=Y
ENV PRIVACY_CONSENT=Y
ENV DEBIAN_FRONTEND=noninteractive
ENV CONDA_ALWAYS_YES=true
ENV TORCH_CUDA_ARCH_LIST=${TORCH_ARCH}
ENV MAX_JOBS=4
ENV QT_QPA_PLATFORM=offscreen

RUN apt-get update && apt-get install -y \
    build-essential \
    libboost-program-options-dev \
    libboost-filesystem-dev \
    libboost-graph-dev \
    libboost-system-dev \
    libboost-test-dev \
    libeigen3-dev \
    libsuitesparse-dev \
    libfreeimage-dev \
    libmetis-dev \
    libgoogle-glog-dev \
    libgflags-dev \
    libglew-dev \
    libgmock-dev \
    qtbase5-dev \
    libqt5opengl5-dev \
    libcgal-dev \
    libcgal-qt5-dev \
    libpdal-dev \
    pdal \
    libatlas-base-dev \
    libflann-dev \
    libboost-all-dev \
    libopencv-dev \
    libgtest-dev \
    libsqlite3-dev \
    libglm-dev \
    libceres-dev \
    libcurl4-openssl-dev \
    libmkl-full-dev \
    liblaszip-dev \
    python3-pip \
    wget \
    bzip2 \
    ca-certificates \
    curl \
    git \
    libpcl-dev \
    pcl-tools \
    qttools5-dev \
    qttools5-dev-tools \
    flatpak \
    ssh \
    cmake \
    xvfb  \
    libfreetype6-dev \
    libpng-dev \
    libjpeg-dev \
    libtiff-dev \
    libgif-dev \
    libwebp-dev \
    zlib1g-dev \
    libxft-dev \
    pkg-config && rm -rf /var/lib/apt/lists/*

WORKDIR /root
COPY . .
# cloudcompare
RUN git clone https://github.com/CloudCompare/CloudCompare.git
RUN cd CloudCompare && git checkout v2.13.2 && git submodule update --init --recursive && \
    mkdir build && cd build && \
    cmake .. -DCMAKE_BUILD_TYPE=Release -DPLUGIN_STANDARD_QPCL=ON \
    -DPLUGIN_IO_QLAS=ON -DPLUGIN_IO_QCORE=ON -DPLUGIN_IO_QPDAL=ON && \
    make -j$(nproc -1) && make install && cd ../.. &&  rm -rf CloudCompare

# Install colmap-pcd
RUN git clone https://github.com/XiaoBaiiiiii/colmap-pcd.git
RUN cd colmap-pcd && git checkout 9cd7d9b7f257306483dc6ecc95d4ef447335888d && git apply ../patch/colmap-pcd.patch \
     && mkdir build && cd build && cmake .. && make -j$(nproc -1) && make install && cd ../.. && rm -rf colmap-pcd

# Install conda env
ENV CONDA_DIR=/opt/conda
ENV PATH=$CONDA_DIR/bin:$PATH

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-py312_24.9.2-0-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc

# config conda env prevent to auto activate base env.
RUN conda config --set auto_activate_base false && \
    conda clean -afy

RUN conda --version && python --version

FROM system-builder AS pgsr-builder
# Install PGSR enviroments
RUN cd ./third_party && git clone https://github.com/zju3dv/PGSR.git && cd PGSR && \
    git checkout de24f1a38b350387e8d8fe381b2cd70c1ae946e7 && \
    git apply ../../patch/pgsr.patch && \
    git submodule update --init --recursive && \
    conda init && \
    conda create -n pgsr python=3.8 -y

RUN --mount=type=cache,target=/root/.cache/pip \
    conda run -n pgsr pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/${PT_CU_VER}

RUN --mount=type=cache,target=/root/.cache/pip \
    cd ./third_party/PGSR && conda run -n pgsr pip install -r requirements.txt

RUN --mount=type=cache,target=/root/.cache/pip \
    cd ./third_party/PGSR && conda run -n pgsr pip install pycolmap==3.11.1 && \
    conda run -n pgsr pip install submodules/diff-plane-rasterization && \
    conda run -n pgsr pip install submodules/simple-knn rich laspy

FROM pgsr-builder AS difix-builder
# install Difix3d
RUN conda create -n difix python=3.8 -y

RUN --mount=type=cache,target=/root/.cache/pip \
    conda run -n difix pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/${PT_CU_VER}

RUN --mount=type=cache,target=/root/.cache/pip \
    cd ./third_party && git clone https://github.com/nv-tlabs/Difix3D.git && \
    conda run -n difix pip3 install -r Difix3D/requirements.txt

RUN --mount=type=cache,target=/root/.cache/pip \
    conda run -n difix pip3 install matplotlib scikit-learn plyfile rich

FROM difix-builder AS gsplat-builder
# gsplat install
RUN conda create -n gsplat python=3.8 -y

RUN --mount=type=cache,target=/root/.cache/pip \
    conda run -n gsplat python3 -m pip install plyfile

RUN --mount=type=cache,target=/root/.cache/pip \
    conda run -n gsplat python3 -m pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/${PT_CU_VER}

RUN --mount=type=cache,target=/root/.cache/pip \
    cd ./third_party/gsplat && conda run -n gsplat pip3 uninstall pycolmap -y || true && \
    conda run -n gsplat pip3 install -r examples/requirements.txt && \
    conda run -n gsplat python -m pip install .

RUN cd ./third_party && git clone https://github.com/cvg/Hierarchical-Localization/  && \
    cd Hierarchical-Localization && \
    git checkout e33422019fee354b7887d05cf6deb525cfe47524  && \
    git submodule update --init --recursive && \
    git apply ../../patch/hloc.patch

ENV PYTHONPATH="/root/third_party/Hierarchical-Localization:${PYTHONPATH}"
RUN --mount=type=cache,target=/root/.cache/pip \
    cd /root/third_party/Hierarchical-Localization && \
    /opt/conda/envs/pgsr/bin/python -m pip install -r requirements.txt && \
    /opt/conda/envs/pgsr/bin/python -m pip install -e .

RUN rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
