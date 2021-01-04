My homepage. Everything is CC BY-NC-SA 3.0.

To build:

    $ stack build
    $ stack exec site build

To push:

    $ git subtree push --prefix _site origin master

To convert a Jupyter notebook into Markdown:

```
sudo apt install jupyter-nbconvert
jupyter-nbconvert --to markdown --template basic <...>.ipynb
```

# Syntax highlighting

See: https://pandoc.org/MANUAL.html#syntax-highlighting

It uses [skylighting](https://github.com/jgm/skylighting) library under the hood.

```
pandoc --list-highlighted-languages
```

```
stack install --flag skylighting-core:executable skylighting-core
```

```
skylighting --help
```
