#docker build -t dl-blockchain .
ARG BASE_CONTAINER=jupyter/base-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Jupyter Project <jupyter@googlegroups.com>"

# Install Tensorflow
RUN pip install --quiet \
    'tensorflow==1.13.1' && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

USER root

RUN apt-get -y update && \
	apt-get -y install software-properties-common && \
	add-apt-repository ppa:ethereum/ethereum && \
	apt-get -y update  

RUN apt-get -y install libsnappy-dev && \
	apt-get -y install solc && \
	apt-get -y install nodejs-dev node-gyp libssl1.0-dev npm && \
	npm install n --g && \
	n 10.15.3 && \
	npm install ganache-cli -g

RUN apt-get -y install python-tk python3-tk tk-dev

# Switch back to jovyan to avoid accidental container runs as root

   
USER ${NB_UID}
WORKDIR /home/${NB_USER}

RUN fix-permissions /home/${NB_USER}
COPY . . 
RUN pip install -r requirements.txt

# Bundle app source
