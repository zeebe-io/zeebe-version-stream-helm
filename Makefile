DIR := "zeebe-version-stream"
OS := $(shell uname)

build: clean
	rm -rf requirements.lock
	helm3 version
	helm3 repo add zeebe http://helm.zeebe.io
	helm3 repo update
	helm3 dependency build ${DIR}
	helm3 lint ${DIR}

install: 
	helm3 upgrade ${CLUSTER_NAME} ${DIR} --install --namespace ${NAMESPACE} --debug

delete:
	

clean:
