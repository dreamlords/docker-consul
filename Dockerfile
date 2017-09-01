FROM nginx:latest

ENTRYPOINT ["/bin/start.sh"]
EXPOSE 80
VOLUME /templates
ENV CONSUL_URL consul:8500

ADD start.sh /bin/start.sh
RUN rm -rf /etc/nginx/conf.d/*.conf
ADD consul-template /usr/bin/consul-template
