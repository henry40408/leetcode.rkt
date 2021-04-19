#lang racket

(require rackunit)

(define/contract (is-palindrome x)
  (-> exact-integer? boolean?)
    (define (is-palindrome- x)
      (define lst (string->list (number->string x)))
      (define half (/ (length lst) 2))
      (equal? (take lst (floor half)) (reverse (list-tail lst (ceiling half)))))
    (match x
      [x #:when (negative? x) #f]
      [x #:when (and (>= x 0) (<= x 9)) #t]
      [x (is-palindrome- x)])
  )

(check-equal? (is-palindrome 121) #t)
(check-equal? (is-palindrome -121) #f)
(check-equal? (is-palindrome 10) #f)
(check-equal? (is-palindrome -101) #f)
(check-equal? (is-palindrome 0) #t)
(check-equal? (is-palindrome 88888) #t)
