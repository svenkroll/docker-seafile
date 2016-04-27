# Seafile

## Prerequisites
- MySQL container started
  as example: ```sh docker run --name mysql -e MYSQL_ROOT_PASSWORD=MySecretPassword -d mysql:5.6 ```
- The following folders to keep data and configuration files exists
  /opt/seafile-data/seafile-data
  /opt/seafile-data/seahub-data
  /opt/seafile-data/pro-data
  /opt/conf/seafile/conf
  /opt/conf/seafile/ccnet

## First run
Create the container and run the setup script to create the database and configuration files
```sh
docker run -it --name seafile --link mysql:mysql \
-v /opt/seafile-data/seafile-data/:/seafile/seafile-data \
-v /opt/seafile-data/seahub-data/:/seafile/seahub-data \
-v /opt/seafile-data/pro-data/:/seafile/pro-data \
-v /opt/conf/seafile/conf/:/seafile/conf \
-v /opt/conf/seafile/ccnet/:/seafile/ccnet \
seafile bash

/seafile/sefile-server-latest/setup-seafile-mysql.sh
```
When completed exit and remove the container
```sh
ctrl+d
docker rm -fv seafile
```

## Run
```sh
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
```