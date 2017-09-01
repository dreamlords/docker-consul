```bash
# single consul
docker run -d --net=host --name consul -h consul -e 'CONSUL_LOCAL_CONFIG={"skip_leave_on_interrupt": true}' consul agent -server -client 163.44.165.142 -ui -bootstrap

# registrator
docker run -d --net=host -v /var/run/docker.sock:/tmp/docker.sock --name registrator -h registrator gliderlabs/registrator:latest -internal consul://localhost:8500

# nginx with consul-template
docker run -p 8080:80 -d --name nginx -e CONSUL_URL=163.44.165.142:8500 --volume /tmp/service.ctmpl:/templates/service.ctmpl  nginx-consul

# service node
docker run -d -P --name node1 -h node1 jlordiales/python-micro-service:latest
docker run -d -P --name node2 -h node2 jlordiales/python-micro-service:latest
docker run -d -P --name node3 -h node3 jlordiales/python-micro-service:latest
```
