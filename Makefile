all:
	mkdir -p target
	scalac -d target src/stasiak/karol/fimpp/*
	cd target && jar cfe ../bin/fimpp.jar stasiak.karol.fimpp.Main stasiak

test:
	./test-examples.sh

clean:
	rm -r target

.PHONY: clean test
