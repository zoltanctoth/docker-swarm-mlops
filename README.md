# docker-swarm-mlops

Notes on building a highly available MLOps platform with Docker Swarm.

## Further improvements

- [ ]  Introduce [service config](https://docs.docker.com/engine/swarm/configs/) instead of env vars
- [ ]  Consider using [secrets](https://docs.docker.com/engine/swarm/secrets/) for sensitive config
- [ ]  Add swarm visualizer [https://github.com/dockersamples/docker-swarm-visualizer](https://github.com/dockersamples/docker-swarm-visualizer) (poor man solution)
- [ ]  Add [https://www.portainer.io/](https://www.portainer.io/) to manage stacks (has user/groups base auth)
- [ ]  Add [https://woodpecker-ci.org/](https://woodpecker-ci.org/) instead of jenkins for cloud-native ci/cd pipeline

- [https://docs.docker.com/compose/install/linux/#install-the-plugin-manually](https://docs.docker.com/compose/install/linux/#install-the-plugin-manually)
- [https://github.com/nginx-proxy/nginx-proxy](https://github.com/nginx-proxy/nginx-proxy)

## local registry:

```bash
docker run -d -p 5000:5000 registry:2
```

build: (CI/CD) 

```bash
docker build -t g1.nordquant.com:5000/fraudapp:alpine  .
docker push g1.nordquant.com:5000/fraudapp:alpine

# docker compose build && docker compose push
```

allow insecure registry

```bash
echo '{"insecure-registries" : ["g1.nordquant.com:5000"]}' | sudo tee /etc/docker/daemon.json
sudo systemctl restart docker
```

pinpoint registry service to g1 node

```bash
docker node update g1.nordquant.com --label-add reg=true
```

add lines to stack.yaml

```bash
deploy:
      placement:
        constraints:
        - node.labels.reg==true
```

## traefik

- https://github.com/lalyos/docker-traefik
