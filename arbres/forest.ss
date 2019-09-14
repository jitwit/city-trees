(import (srfi :13)
	(srfi :14))

(define (input)
  (let loop ((next (read))
	     (tokens '()))
    (if (eof-object? next)
	(reverse tokens)
	(loop (read) (cons next tokens)))))

(define (lines)
  (let ((port (current-input-port)))
    (let loop ((line (get-line port))
	       (ls '()))
      (if (eof-object? line)
	  (reverse ls)
	  (loop (get-line port)
		(cons (with-input-from-string line input)
		      ls))))))

(define (tokenize-comma row)
  (string-tokenize row (char-set-complement
			 (char-set #\,))))

(define (tokenize-line str)
  (string-tokenize str (char-set-complement
			 (char-set #\newline))))

