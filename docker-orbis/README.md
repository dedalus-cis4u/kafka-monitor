# Kafka Monitor for Orbis U

## Goals
* build images and push them to the Orbis Docker registry so that they can reach Orbis U environments
* change Kafka configuration to match the Orbis U Kafka cluster
* add an HTTP server to access Kafka Monitor GUI (more) easily

## Run it

```shell
kubectl apply -f kafka-monitor-pod.yaml
```

To access Kafka Monitor GUI:
```shell
# Forward calls to Jolokia
kubectl port-forward kafka-monitor 8778:8778
```

```shell
# Forward call to the HTTP server
kubectl port-forward kafka-monitor 8877:80
```
Open http://localhost:8877/ in a browser.

## Build it

**IMPORTANT**: the default image build by the source project is
`quay.io/samsung_cnct/kafka-monitor` has no official public registry, so
an image `samsung_cnct/kafka-monitor` as been build and pushed in the Orbis Docker registry and is used to build the `orbis-u/kafka-monitor` image.

```shell
cd docker-orbis

# update the tag in Makefile...
make container
# or set it via the command line
# make container -e TAG=0.3

# create a tag to be able to push it in the Orbis Docker registry
docker tag orbis-u/kafka-monitor:0.3 registry-nexus.orbis.dedalus.com:17521/orbis-u/kafka-monitor:0.3
# push
docker push registry-nexus.orbis.dedalus.com:17521/orbis-u/kafka-monitor:0.3
```