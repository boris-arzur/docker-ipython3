FROM debian:experimental
ENV DEBIAN_FRONTEND noninteractive
MAINTAINER boris

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -yqq ipython3-notebook python3-matplotlib nano vim python3-mpld3 python3-requests python3-scipy\
 && cp /usr/lib/python3/dist-packages/mpld3/js/mpld3.v0.3git.min.js /usr/lib/python3/dist-packages/mpld3/js/d3.v3.min.js\
 && useradd -d /home/ipy -m -s /bin/bash ipy\
 && mkdir -p /home/ipy/.ipython/profile_default/

COPY ipython_notebook_config.py /home/ipy/.ipython/profile_default/
COPY custom_widgin.ipynb /home/ipy/
COPY openssl.cnf /home/ipy/

RUN chown ipy:ipy -R /home/ipy/ && chmod go= -R /home/ipy/

WORKDIR /home/ipy
USER ipy

RUN openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout cert.pem -out cert.pem -config openssl.cnf
CMD ipython3 notebook
