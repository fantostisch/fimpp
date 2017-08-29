all:
	mkdir -p target
	scalac -d target src/stasiak/karol/fimpp/*
	cd target && jar cfe ../bin/fimpp.jar stasiak.karol.fimpp.Main stasiak

test:
	./run_tests.sh

test-parser:
	scala -classpath bin/fimpp.jar test/UnitTests.scala

clean:
	rm -r target

.PHONY: all test test-parser clean
