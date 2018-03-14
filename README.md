My homepage. Everything is CC BY-NC-SA 3.0.

To build:

    $ stack install hakyll --resolver lts-10.9
    $ stack build
    $ stack exec site build

To push:

    $ stack exec site deploy
    $ git subtree push --prefix _site origin master

TODO(prvak): Fix deployCommand in site.hs once rny.cz is a 301 redirect
