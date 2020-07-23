
build: kafka-bash-completion
kafka-bash-completion:
	./build --makefile
clean:
	rm kafka-bash-completion
install: build
	./build --install

