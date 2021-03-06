### **Equations** - a function definition plugin.

[![Build Status](https://travis-ci.org/mattam82/Coq-Equations.svg?branch=master)](https://travis-ci.org/mattam82/Coq-Equations)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.1117297.svg)](https://doi.org/10.5281/zenodo.1117297)
[![Gitter](https://img.shields.io/gitter/room/nwjs/nw.js.svg)](https://gitter.im/coq/Equations)

Copyright 2009-2017 Matthieu Sozeau `matthieu.sozeau@inria.fr`  
Copyright 2015-2017 Cyprien Mangin `cyprien.mangin@m4x.org`

Distributed under the terms of the GNU Lesser General Public License
Version 2.1
(see
[LICENSE](http://github.com/mattam82/Coq-Equations/raw/master/LICENSE)
for details).

Equations provides a notation for writing programs by dependent 
pattern-matching and (well-founded) recursion
in [Coq](http://coq.inria.fr). It compiles everything down to
eliminators for inductive types, equality and accessibility,
providing a definitional extension to the Coq kernel.

## Documentation

The [reference manual](http://github.com/mattam82/Coq-Equations/raw/master/doc/equations.pdf)
providing an introduction is available along with [examples](examples).

## Papers

Two articles describing the system are available:

- [Equations Reloaded](http://www.irif.fr/~sozeau/research/publications/drafts/Equations_Reloaded.pdf), Cyprien Mangin and
  Matthieu Sozeau (October
  2017). Submitted.
- [Equations: A Dependent Pattern-Matching Compiler](https://link.springer.com/chapter/10.1007/978-3-642-14052-5_29) Matthieu
  Sozeau (2010) 
  In: Kaufmann M., Paulson L.C. (eds) Interactive Theorem
  Proving. ITP 2010. Lecture Notes in Computer Science,
  vol 6172. Springer, Berlin, Heidelberg.

We did a case study on a proof of normalization for an hereditary substitution
procedure:

- [Equations for Hereditary Substitution in Leivant's Predicative
SystemF: A Case Study](http://www.irif.fr/~sozeau/research/publications/Equations_for_Hereditary_Substitution_in_Leivants_Predicative_System_F:_a_case_study.pdf)
  Cyprien Mangin and Matthieu Sozeau. 
  In: Proceedings Tenth International Workshop on Logical Frameworks and Meta Languages: Theory and Practice. 
  Volume 185 of EPTCS. May 2015 - LFMTP'15. 

## Installation

The current development version works with Coq 8.6 (branch [master](https://github.com/mattam82/Coq-Equations/tree/master)) and Coq 8.7 (branch [8.7](https://github.com/mattam82/Coq-Equations/tree/8.7)),
see [releases](https://github.com/mattam82/Coq-Equations/releases) for
sources.

# Install with OPAM
This package is available on [OPAM](http://opam.ocaml.org/).
Activate the [Coq repository](https://github.com/coq/opam-coq-archive)
if you didn't do it yet:

    opam repo add coq-released https://coq.inria.fr/opam/released

and run:

    opam install coq-equations

To get the beta versions of Coq, activate the repository:

    opam repo add coq-core-dev https://coq.inria.fr/opam/core-dev

To get the development version of Equations, activate the repository:

    opam repo add coq-extra-dev https://coq.inria.fr/opam/extra-dev

# Install from source
Alternatively, to compile Equations, simply run:

    coq_makefile -f _CoqProject -o Makefile
    make

in the toplevel directory, with `coqc` and `ocamlc` in your path.

Then add the paths to your `.coqrc`:

    Add ML Path "/Users/mat/research/coq/equations/src".
    Add Rec LoadPath "/Users/mat/research/coq/equations/theories" as Equations.

Or install it:

    make install

As usual, you will need to run this command with the appropriate privileges
if the version of Coq you are using is installed system-wide, rather than
in your own directory. E.g. on Ubuntu, you would prefix the command with
`sudo` and then enter your user account password when prompted.

