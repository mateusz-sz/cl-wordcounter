(require :lisp-unit)

(defpackage :word-counter-tests
  (:use :cl :lisp-unit :word-counter))

(in-package :word-counter-tests)

;; distinct-word-count should properly count distinct words and be case insensitive
(define-test test-distinct-word-count
  (assert-equal 3 (distinct-word-count '("hello" "world" "hello" "WORLD" "Test")))
  (assert-equal 1 (distinct-word-count '("word" "WORD" "Word")))
  (assert-equal 0 (distinct-word-count '()))
  (assert-equal 4 (distinct-word-count '("one" "two" "three" "four"))))

;; read-words-from-file should read in the words as list from txt file
(define-test test-read-words-from-file
  ;; create a temporary test file
  (with-open-file (stream "test_words.txt"
                         :direction :output
                         :if-exists :supersede)
    (format stream "hello world~%test TEST~%hello"))

  (let ((words (read-words-from-file "test_words.txt")))
    (assert-equal 5 (length words))
    (assert-equal '("hello" "world" "test" "TEST" "hello") words))

  ;; Delete the temporary file
  (delete-file "test_words.txt"))
