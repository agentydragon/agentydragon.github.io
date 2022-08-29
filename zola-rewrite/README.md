```
cd agentydragon
zola serve
```

TODO:
- make all posts still reachable under old URLs - e.g.: https://agentydragon.com/posts/2020-12-31-cartpole-q-learning.html
  - according to https://www.getzola.org/documentation/content/page/#front-matter,
    if the filename starts with a date, it's stripped. so current output path
    would be: https://agentydragon.com/posts/cartpole-q-learning
  - slugification strategies exist - https://www.getzola.org/documentation/getting-started/configuration/#slugification-strategies
    - but the ISO date stripping seems non-optional
    - maybe just off?
      - no. just `[slugify] paths = "off"` does not seem to work...
      - I guess I *could* literally just add an alias to every pre-existing
	post...
