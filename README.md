My homepage. Everything is CC BY-NC-SA 3.0.

To build:

    $ cabal install hakyll
    $ ghc --make -threaded site.hs
    $ ./site build

To push:

    $ ./site deploy
    $ git subtree push --prefix _site origin master

TODO(prvak): Fix deployCommand in site.hs once rny.cz is a 301 redirect
