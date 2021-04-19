#lang racket

(require rackunit)

(define/contract (reverse x)
  (-> exact-integer? exact-integer?)
    (define clamp (expt 2 31))

    (define (reverse- lst result)
      (if (null? lst) result (reverse- (list-tail lst 1) (cons (first lst) result))))
    
    (define y (string->number (list->string (reverse- (string->list (number->string (abs x))) '()))))
    (define z (if (negative? x) (* -1 y) y))
    (if (and (> z (* -1 clamp)) (< z clamp)) z 0)
  )

(check-equal? (reverse 123) 321)
(check-equal? (reverse -123) -321)
(check-equal? (reverse 120) 21)
(check-equal? (reverse 0) 0)
(check-equal? (reverse 1534236469) 0)
