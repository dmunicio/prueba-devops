all: lint build test

.PHONY: build
build: cuenta

cuenta: cuenta.c
	@echo "#Compiling"
	gcc -Wall cuenta.c -o cuenta
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
	./upload-to-s3.sh
	
.PHONY: showinfo
showinfo:
	cat /etc/os-release

docker-%:
	docker run --rm -v `pwd`:/src --network host prantlf/alpine-make-gcc:latest /bin/sh -c "cd /src && make $*"
