FROM openresty/openresty:centos
MAINTAINER GAURI SHANKAR P <gauri.gshankar@yahoo.co.in>
RUN yum -y update; yum clean all
RUN yum -y install cronie; yum clean all
RUN mkdir -p /usr/local/gauri/nginxConf
RUN mkdir -p /usr/local/gauri/luaConf
RUN mkdir -p /usr/local/gauri/scripts
COPY scripts /usr/local/gauri/scripts
COPY html /usr/local/openresty/nginx/html
ADD conf/nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
ADD luaConf/nginx.lua /usr/local/gauri/luaConf/nginx.lua
RUN chmod 777 /usr/local/gauri/scripts/reloadNginxOnLuaChanges.sh
RUN cp /usr/local/gauri/scripts/cronjob.sh /etc/cron.d/per_minute_nginx_reload
EXPOSE 80
ENTRYPOINT ./usr/local/gauri/scripts/startup.sh
