# BASH-PREV

This script lets you preview Markdown files from the terminal.

1. Converts the given file(s) from Markdown to HTML with Pandoc

2. Saves the file in the `/tmp` directory with a randomly given
   name

3. Opens the file with the browser

If the `-t` flag is given, it opens with a terminal-based
browser. Default is `w3m`. Without flags, it opens with the
GUI-based browser --- default is `firefox`.

Usage:

```bash
prev filename.txt # Opens with GUI browser
```

or

```bash
prev -t filename.txt # Opens with terminal browser
```

To install, download the `prev.sh` file to a directory, and,
then, import it to your `bashrc` file with:

```bash
. path/to/prev.sh
```

(Adjust the path to the location you downloaded the file)
