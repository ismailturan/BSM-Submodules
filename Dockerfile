FROM rocker/binder:3.4.2

RUN apt-get install bash-completion 
RUN pip install jupyter-console
RUN pip install pyslha
RUN pip install bash_kernel
#

ENV NB_USER sarah
ENV NB_UID 1000
ENV HOME /home/sarah
WORKDIR ${HOME}

USER ${NB_USER}


# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}
USER root
RUN chown -R ${NB_UID}:${NB_UID} ${HOME}
RUN python2 -m pip install ipykernel

USER ${NB_USER}
python2 -m ipykernel install --user



