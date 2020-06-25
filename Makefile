OF=kafka-bash-completion
ID=/etc/bash_completion.d

build: kafka-bash-completion
kafka-bash-completion:
	./build --makefile
clean:
	rm kafka-bash-completion
install: build
	cp $(OF) $(ID)

