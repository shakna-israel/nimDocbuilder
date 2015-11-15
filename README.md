# nimDocbuilder

nimDocbuilder is a documentation tool for Nim, akin to rDoc or it's namesake, docbuilder.

It is a limited nim implementation of [docbuilder](https://github.com/shakna-israel/docbuilder).

---

## Binaries

Precompiled versions can be found in the [bins](bins) folder.

---

## Compiling

You will need [nim](http://nim-lang.org) installed.

To get the files:

```
git clone https://github.com/shakna-israel/nimDocbuilder.git
git checkout master
```

To compile, I recommend:

```
nim c -d:release nimDocbuilder.nim
strip nimDocbuilder
```

*Strip is not available on all platforms, but significantly reduces the size of the executable.*

---

## Usage:

nimDocbuilder expects you to follow the docBuilder syntax.

Which is basically ensuring *# * is before every line that is intended to be treated as Markdown.

Those two characters will be automatically stripped.

So, this:

```
# # Hello
# World
```

becomes:

```
# Hello
World
```
Once your comments are formatted as you want, you can run nimDocbuilder as such:

```
./nimDocbuilder
thisIsMyFile.nim
```

And it will output a file called ```thisIsMyFile.docb.md```.

If you do not have the ```.nim``` file extension, ```.docb.md``` will be appended directly to the name.

e.g.

```
nanoNah.nimc -> nanoNah.nimc.doc.md
```
---

## License

MIT License, see [LICENSE](LICENSE) for more information.

---

## Contributing

There is a *lot* of functonality in [docbuilder](http://github.com/shakna-israel/docbuilder) that needs to be ported.
