#lang racket

(require rackunit)

(define/contract (two-sum nums target)
  (-> (listof exact-integer?) exact-integer? (listof exact-integer?))
  (define my-hash (make-hash))
  (define (f nums target index)
    (define num (list-ref nums 0))
    (define key (- target num))
    (if (hash-has-key? my-hash key)
      (list (hash-ref my-hash key) index)
      (begin
        (hash-set! my-hash num index)
        (f (list-tail nums 1) target (+ index 1)))
    ))
  (f nums target 0))

(check-equal? (two-sum '(3 3) 6) '(0 1))
(check-equal? (two-sum '(2 7 11 15) 9) '(0 1))
