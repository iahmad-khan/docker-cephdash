FROM ubuntu:14.04

RUN apt-get -y update

RUN apt-get -y install git-core apache2 libapache2-mod-wsgi python-ceph python-flask

RUN cd /opt && \
    git clone https://github.com/Crapworks/ceph-dash.git

RUN rm /etc/apache2/sites-enabled/*

RUN a2enmod wsgi

ADD vhost.apache2.conf /etc/apache2/sites-enabled/cephdash.conf

RUN mkdir /etc/ceph && touch /etc/ceph/ceph.conf

ADD cephdash.sh /usr/local/sbin/cephdash

RUN chmod +x /usr/local/sbin/cephdash

EXPOSE 80

CMD ["cephdash"]
