## Wordcounter
A simple Common Lisp script (SBCL implementation), that counts distinct words in a text file. The counter is case insensitive.

### Usage
1. Generate words with the python script (`python3 generate-words.py <number of words>`), or write them manually into the `random_words.txt` file
2. Open REPL session
  * `(load "main.lisp")`
  * (word-counter:distinct-word-count (word-counter:read-words-from-file "random_words.txt"))

If you want to run the unit tests:
  * `(load "tests.lisp")`
