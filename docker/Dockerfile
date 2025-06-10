ARG scipy_notebook_version=2024-10-07
FROM quay.io/jupyter/scipy-notebook:${scipy_notebook_version}

LABEL maintainer="Damian Barsotti<damian.barsotti@unc.edu.ar>"

ARG scipy_notebook_version

#ADD ./requirements.txt /tmp/
COPY --chown=root --chmod=666 ./requirements.txt ./

RUN pip install -r ./requirements.txt

RUN rm -f ./requirements.txt

USER root

RUN apt-get update -q && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq  mc

USER jovyan
