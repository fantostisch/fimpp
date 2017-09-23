#!/bin/bash

compare() {
	out=$1
	ok=${out%.out}.ok

	local rv

	if [ -e "$ok" ]; then
		if ! diff -u "$ok" "$out"; then
			rv=1
			echo "failed"
		else
			rv=0
			echo "ok"
			rm "$out"
		fi
	else
		rv=1
		echo "first run"
		cp "$out" "$ok"
	fi

	return $rv
}

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

	bin/fimpp "$src" > "$out" 2>&1

	compare "$out" || rv=1
done

out="test/UnitTests.out"

echo -n "Running unit tests... "

scala -classpath bin/fimpp.jar test/UnitTests.scala > "$out"

compare "$out" || rv=1

exit "$rv"
