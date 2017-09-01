FROM nginx:latest

ENTRYPOINT ["/bin/start.sh"]
EXPOSE 80
VOLUME /templates
ENV CONSUL_URL consul:8500

ADD start.sh /bin/start.sh
RUN rm -rf /etc/nginx/conf.d/*.conf
ADD https://releases.hashicorp.com/consul-template/0.19.1/consul-template_0.19.1_linux_amd64.tgz /usr/bin/consul-template
