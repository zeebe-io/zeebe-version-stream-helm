DIR := "zeebe-version-stream"
OS := $(shell uname)

build: clean
	rm -rf requirements.lock
	helm3 version
	helm3 repo add zeebe http://helm.camunda.io
	helm3 repo update
	helm3 dependency build ${DIR}
	helm3 lint ${DIR}

install: 
	helm3 upgrade ${CLUSTER_NAME} ${DIR} --install --namespace ${NAMESPACE} --set global.elasticsearch.host=${ELASTICSEARCH_HOST} --set global.elasticsearch.port=${ELASTICSEARCH_PORT} --set operate.enabled=${OPERATE_ENABLED} --set zeebe.elasticsearch.enabled=${ELASTICSEARCH_ENABLED} --set zeebe.kibana.enabled=${KIBANA_ENABLED} --set zeebe.prometheus.enabled=${KIBANA_ENABLED} --debug

delete:
	

clean:
