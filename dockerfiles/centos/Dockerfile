FROM centos:latest
RUN yum install -y gcc make tar wget openssl-devel bzip2-devel && cd /usr/src && wget https://www.python.org/ftp/python/2.7.15/Python-2.7.15.tgz && tar xzf Python-2.7.15.tgz && cd Python-2.7.15 && ./configure && make install
