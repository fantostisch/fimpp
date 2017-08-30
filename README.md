# FIM++ interpreter

FIM++ is an esoteric programming language inspired by the cartoon My Little
Pony: Friendship is Magic. In the early episodes of the show, the unicorn
Twilight Sparkle is regularly seen writing letters to her mentor, princess
Celestia. In the letters she often reports on the latest lessons she learned in
her studies of the magic of friendship or the adventures of her and her friends.

The programs in FIM++ are made to resemble these letters. FIM++ is an
imperative, dynamically-typed, interpreted language. Currently, it supports
integer arithmetic, console output, dynamically growing arrays, and
subroutines. FIM++ programs can also use arbitrary Java classes, which opens it
to the rich and wide JVM ecosystem. This, for instance, makes it possible to
write a simple graphical program using Swing.

The language's syntax leaves some freedom for the programmer, allowing them to
make their programs look more like a coherent letter to a pony princess. For
example, the traditional *Hello, World!* written in FIM++ might look like this:

    Dear Princess Celestia: An example letter.

    Today I learned about greetings:

    I said "Hello, Equestria".

    Your faithful student, Twilight Sparkle.

You can find more involved examples under the `examples` subdirectory,
including famous algorithms such as the [Sieve of Eratosthenes][1] and [Quicksort][2].
There you can also find an implementation of the [Brainfuck][3] interpreter,
which proves the Turing completeness of the FIM++ language.

[1]: https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
[2]: https://en.wikipedia.org/wiki/Quicksort
[3]: https://en.wikipedia.org/wiki/Brainfuck

The original FIM++ interpreter was created by @KarolS on GitHub. It was
inspired by [a post][4] by Cereal Velocity on Equestria Daily and some
[example programs][5] written by DeftCrow and others on DeviantArt. See also
the FIM++ page at the [Esolang Wiki][5a].

[4]: http://www.equestriadaily.com/2012/10/editorial-fim-pony-programming-language.html
[5]: http://deftcrow.deviantart.com/art/FiM-Programming-Hello-World-99-Jugs-of-Cider-330736334
[5a]: https://esolangs.org/wiki/FiM%2B%2B

## Compilation

You will need the [Scala compiler][6] and the Java Development Kit (JDK) to
build the *fimpp* interpreter from source. Be warned that there are some known
problems when using newer Scala and Java versions (any contributions in that
regard would be most welcome). Scala 2.9.2 and OpenJDK 7 in Debian Jessie are
known to work. If you have problems getting things to play nicely, see *Running
from Docker* below.

[6]: http://www.scala-lang.org/downloads

On a Debian GNU/Linux system, the Scala compiler can be installed with the
following command:

    $ sudo apt-get install scala

The easiest way to compile the FIM++ interpreter is to use the provided
Makefile:

    $ make

And that's all! A freshly compiled `fimpp.jar` should land in your `bin`
directory!

If you want to compile it manually (e.g. there is no `make` on your system),
follow these steps. These steps should also work on Windows:

    $ mkdir target
    $ scalac -d target src/stasiak/karol/fimpp/*
    $ cd target
    $ jar cfe ../bin/fimpp.jar stasiak.karol.fimpp.Main stasiak

If you want to make sure everything works as expected, run some tests:

    $ make test

## Running

In the `bin` directory, there are all necessary scripts to run this interpreter
on any machine with Java installed. To run the interpreter with a given FIM++
source file from your command line on a Linux system:

    $ bin/fimpp <FIM++ script file>

There is also a `fimpp.bat` available for running on Windows.

## Running from Docker

There is a [Docker container][7] with *fimpp* available. This should make it
possible to run *fimpp* on any machine capable of running Docker containers,
regardless of Java version conflicts. However this does come at a price of a
hefty download.

[7]: https://www.docker.com/

First pull the container from Docker Hub:

    $ docker pull avian2/fimpp

After that, you can run the `99bottles.fimpp` example like this:

    $ docker run avian2/fimpp examples/99bottles.fimpp

Or to run your own program `letter.fimpp` (that you saved into the current
working directory):

    $ docker run -v `pwd`/letter.fimpp:/letter.fimpp avian2/fimpp /letter.fimpp

## Learning to write programs in FIM++

See the `examples` directory for example programs that demonstrate practically
all features of the language.

The language is reasonably well documented in the `syntax` directory. The best
approach to understanding the language is to study the examples with the help
of these documents.

There is also a (currently incomplete) attempt at a formal grammar
description for FIM++ in `grammar/bnf.pdf`.

## License

fimpp, a FIM++ pony language interpreter

Copyright (C) 2017 Karol Stasiak and other contributors

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
