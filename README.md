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
