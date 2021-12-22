all: lint build test

.PHONY: build
build: cuenta

cuenta: cuenta.c
	@echo "#Compiling"
	gcc -Wall cuenta.c -o cuenta
	chmod a+rw cuenta
	@echo ""

.PHONY: lint
lint:
	@echo "#Linter"
	splint -paramuse cuenta.c
	@echo ""

.PHONY: test
test:
	@echo "#Running tests"
	./test.sh
	@echo ""

.PHONY: clean
clean:
	rm -f cuenta

.PHONY: upload
upload:
	./upload-to-local-folder.sh
	
.PHONY: deploy
deploy: 
	# cp -fp /opt/versions/cuenta-$(VERSION) ./cuenta
	scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -p -i /home/diego-municio/diego/chicago/ta3/devops-chicago.pem ./cuenta ubuntu@3.250.120.231:/home/ubuntu/

####  

.PHONY: build-docker-image
build-docker-image: 
	cd docker && docker build -t ansible-build-image .

.PHONY: upload-to-s3
upload-to-s3: build-docker-image
	docker run --rm -v `pwd`:/opt/prueba-devops -v /opt/credentials/:/opt/credentials ansible-build-image /bin/bash -c "cd /opt/prueba-devops && source /opt/credentials/credentials.sh && aws s3 cp ./cuenta s3://devops-chicago-ta1-artifactory/cuenta-`cat version.txt | head -n 1`"

.PHONY: deploy-with-ansible
deploy-with-ansible: build-docker-image
	#docker run --rm -v `pwd`:/opt/prueba-devops -v /opt/credentials/:/opt/credentials ansible-build-image /bin/bash -c "cd /opt/prueba-devops/ansible && source /opt/credentials/credentials.sh && ansible-playbook -i aws_ec2.yml playbook.yml"
	docker run --rm -v `pwd`:/opt/prueba-devops -v /opt/credentials/:/opt/credentials ansible-build-image /bin/bash -c "cd /opt/prueba-devops/ansible && source /opt/credentials/credentials.sh && aws s3 ls"

.PHONY: showinfo
showinfo:
	cat /etc/os-release

docker-%:
	docker run --rm -v `pwd`:/src --network host prantlf/alpine-make-gcc:latest /bin/sh -c "cd /src && make $*"
