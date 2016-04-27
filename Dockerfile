FROM debian:jessie

RUN mkdir -p /seafile/installed
RUN apt-get update && apt-get install -y --force-yes --no-install-recommends wget default-jre poppler-utils libreoffice python-uno python2.7 libpython2.7 python-setuptools python-imaging python-ldap python-mysqldb python-memcache
RUN easy_install pip && pip install boto
RUN wget --no-check-certificate -O /seafile/seafile-pro-server_5.1.3_x86-64.tar.gz "https://cloud.seafile.de/seafhttp/files/3ba02ceb-67bb-43b8-9c4d-07fe8af8ab3f/seafile-pro-server_5.1.3_x86-64.tar.gz"
RUN cd /seafile && tar -xf seafile-pro-server_5.1.3_x86-64.tar.gz
RUN mv /seafile/seafile-pro-server_5.1.3_x86-64.tar.gz /seafile/installed/seafile-pro-server_5.1.3_x86-64.tar.gz
RUN ln -s /seafile/seafile-pro-server_5.1.3 /seafile/seafile-server-latest


# install Supervisord
RUN apt-get update && apt-get install -y --force-yes --no-install-recommends python-setuptools; easy_install supervisor==3.1.0; mkdir -p /var/log/supervisor; mkdir -p /etc/supervisor
COPY ./supervisord.conf /etc/supervisor/supervisord.conf

CMD ["/usr/local/bin/supervisord","-c","/etc/supervisor/supervisord.conf"]
