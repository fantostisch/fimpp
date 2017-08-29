#!/bin/bash

set -ue

rv=0

echo "Testing examples"

for src in examples/*.fimpp; do
	echo -n "    `basename $src`... "

	if grep -q swing "$src"; then
		echo "skipped"
		continue
	fi

	name=`basename "$src" .fimpp`
	out="test/examples/${name}.out"
	ok="test/examples/${name}.ok"

	bin/fimpp "$src" > "$out" 2>&1

	if [ -e "$ok" ]; then
		if ! diff -u "$ok" "$out"; then
			rv=1
			echo "failed"
		else
			echo "ok"
			rm "$out"
		fi
	else
		echo "first run"
		cp "$out" "$ok"
	fi
done

out="test/UnitTests.out"
ok="test/UnitTests.ok"

echo -n "Running unit tests... "

scala -classpath bin/fimpp.jar test/UnitTests.scala > "$out"

if [ -e "$ok" ]; then
	if ! diff -u "$ok" "$out"; then
		rv=1
		echo "failed"
	else
		echo "ok"
		rm "$out"
	fi
else
	echo "first run"
	cp "$out" "$ok"
fi

exit "$rv"
