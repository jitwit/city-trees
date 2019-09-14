(include "../forest.ss")

(define BEFORE "arbres-publics.csv")
(define CLEAN "arbres.csv")

(define (tokenize-comma row)
  (string-tokenize row (char-set-complement
			 (char-set #\,))))

(define headers
  (with-input-from-file BEFORE
    (lambda ()
      (tokenize-comma
       (get-line (current-input-port))))))

(define (header-ix h)
  (- (length headers)
     (length (member h headers))))

(define trees
  (with-input-from-file CLEAN lines))

(define species
  (let ((table (make-hashtable string-hash string=?)))
    (for-each (lambda (tree)
		(hashtable-set! table
				tree
				(1+ (hashtable-ref table tree 0))))
	      (map (lambda (row)
		     (string-downcase
		       (car row)))
		   trees))
    (sort (lambda (s1 s2)
	    (> (cdr s1) (cdr s2)))
	  (vector->list
	    (hashtable-cells table)))))

(define (find-species S)
  (filter (lambda (s)
	    (string-contains-ci (car s) S))
	  species))

(define common-species
  '("maple"
    "elm"
    "hackberry"
    "linden"
    "ash"
    "locust"
    "spruce"
    "coffee"
    "japanese"
    "cottonwood"
    "pine"
    ""))

(define (gnu-color tree)
  (length
    (memp (lambda (s)
	    (string-contains-ci tree s))
	  common-species)))

(define (write-for-gnuplot)
  (for-each (lambda (tree)
	      (format #t "~a ~a ~a~%"
		      (list-ref tree 1)
		      (list-ref tree 2)
		      (gnu-color (list-ref tree 0))))
	    trees))

