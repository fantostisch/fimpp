#!/bin/bash

set -ue

rv=0

for src in examples/*.fimpp; do
	if grep -q swing "$src"; then
		continue
	fi
	name=`basename "$src" .fimpp`
	out="test/examples/${name}.out"
	ok="test/examples/${name}.ok"

	bin/fimpp "$src" > "$out" 2>&1

	if [ -e "$ok" ]; then
		if ! diff -u "$ok" "$out"; then
			rv=1
		else
			rm "$out"
		fi
	else
		cp "$out" "$ok"
	fi
done

out="test/UnitTests.out"
ok="test/UnitTests.ok"

scala -classpath bin/fimpp.jar test/UnitTests.scala > "$out"

if [ -e "$ok" ]; then
	if ! diff -u "$ok" "$out"; then
		rv=1
	else
		rm "$out"
	fi
else
	cp "$out" "$ok"
fi

exit "$rv"
