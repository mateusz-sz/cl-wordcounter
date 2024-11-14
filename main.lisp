(defpackage :word-counter
  (:use :cl :cl-strings)
  (:export :read-words-from-file :distinct-word-count))

(in-package :word-counter)

(defun read-words-from-file (file-path)
  "Returns a list of words / strings read from the file in which the words are separated by spaces"
  (with-open-file (stream file-path :direction :input)
    (let ((words '()))
      (loop for line = (read-line stream nil)
            while line
            do (dolist (word (split line " "))
                 (push word words)))
      (nreverse words))))

(defun distinct-word-count (words)
  "Counts the number of distinct words in input list. This function is case-insensitive"
  (let ((hash-table (make-hash-table :test #'equal :size (floor (* 0.6 (length words)))))
        (lowercase-words (mapcar (lambda (word) (string-downcase word)) words)))
    (dolist (word lowercase-words)
      (setf (gethash word hash-table) t))
    (hash-table-count hash-table)))

; (format t "Number of distinct words in file random_words.txt is ~D~%"
  ; (distinct-word-count (read-words-from-file "random_words.txt")))
