TAG ?= 0.3

container:
	cd ../ && \
	docker build -t orbis-u/kafka-monitor:$(TAG) -f docker-orbis/Dockerfile .

clean:
	docker rmi orbis-u/kafka-monitor:$(TAG)
