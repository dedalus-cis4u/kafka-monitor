# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# recent version of this image is not available on Docker hub or other public repo, so it needs to be build from
# sources (https://github.com/linkedin/kafka-monitor)
#FROM samsung_cnct/kafka-monitor:1.0
FROM samsung_cnct/kafka-monitor:0.2

MAINTAINER HCIS_Architecture_Technology@dedalus.com

# port 80: access to Kafka Monitor GUI
# port 8778: Jolokia agent
EXPOSE 80 8778

WORKDIR /opt/kafka-monitor
ADD docker-orbis/orbis-modified-docker-entry.sh orbis-modified-docker-entry.sh
RUN chmod +x orbis-modified-docker-entry.sh

RUN sed -i 's/"zookeeper.connect":.*,/"zookeeper.connect": "kafka-cluster-zookeeper-client:2181",/g' config/xinfra-monitor.properties
RUN sed -i 's/"bootstrap.servers":.*,/"bootstrap.servers": "kafka-cluster-kafka-bootstrap:9092",/g' config/xinfra-monitor.properties
RUN sed -i 's/"topic-management.replicationFactor" : 1,/"topic-management.replicationFactor" : 3,/g' config/xinfra-monitor.properties

# install python to run an http server to be able to serve Kakfa-monitor GUI
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python

CMD ["/opt/kafka-monitor/orbis-modified-docker-entry.sh"]
