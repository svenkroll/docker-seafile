# Seafile

## First run
setup-seafile-mysql.sh

## start
docker run -d --name seafile \
--link mysql:mysql \
-p 127.0.0.1:8000:8000 \
-p 127.0.0.1:8082:8082 \
-v /opt/seafile-data/seafile-data/:/seafile/seafile-data \
-v /opt/seafile-data/seahub-data/:/seafile/seahub-data \
-v /opt/seafile-data/pro-data/:/seafile/pro-data \
-v /opt/conf/seafile/conf/:/seafile/conf \
-v /opt/conf/seafile/ccnet/:/seafile/ccnet \
seafile
