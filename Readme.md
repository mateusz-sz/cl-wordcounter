# Common Lisp Word Counter

A simple Common Lisp script (SBCL implementation) that counts the distinct words in a text file. The counter is case-insensitive.

## Prerequisites

To run this code, you need to have the following installed:

1. **Common Lisp Implementation**: This project was developed using SBCL (Steel Bank Common Lisp). Make sure you have a version of Common Lisp installed on your system.
On Debian based linux you can install it from apt:
  ```bash
    sudo apt install sbcl
  ```

2. **Quicklisp**: You can install Quicklisp by following the instructions on the [Quicklisp website](https://www.quicklisp.org/beta/).

3. **cl-strings**: This project uses the `cl-strings` library for string manipulation. Quicklisp will automatically download and install this dependency when you load the project.

4. (optional) python v3.6+: If you want to use my script for generating random words, you'll need to have python installed.

## Installation

1. Clone the repository:
  ```bash
    git clone https://github.com/your-username/cl-wordcounter.git
  ```

2. Change to the project directory:
  ```bash
    cd cl-wordcounter
  ```

## Usage

1. Generate some sample words using the provided Python script:
  ```bash
    python3 generate-words.py 1000
  ```
  This will create a `random_words.txt` file with 1000 random words.
  You can also fulfill the `random_words.txt` file manually with the content of your desire. Keep in mind that the script expects words consisting of english alphabet and encoded in ASCII. Also the script is case-insensitve.

2. Start a Common Lisp REPL (Read-Eval-Print Loop) session and load the main file:
  ```lisp
    (load "main.lisp")
  ```

3. Count the distinct words in the random_words.txt file:
  ```lisp
    (word-counter:distinct-word-count (word-counter:read-words-from-file "random_words.txt"))
  ```
  This will output the number of distinct words in the file.


## Running Tests

Load the test file in your REPL:
  ```lisp
    (load "tests.lisp")
  ```

Run the tests:
  ```lisp
    (run-tests :all)
  ```
This will execute the test suite and report the results.
