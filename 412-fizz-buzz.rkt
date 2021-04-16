#lang racket

(require rackunit)

(define/contract (f m)
  (-> exact-integer? string?)
  (cond
    [(zero? (remainder m 15)) "FizzBuzz"]
    [(zero? (remainder m 5)) "Buzz"]
    [(zero? (remainder m 3)) "Fizz"]
    [else (number->string m)]))

(define/contract (fizz-buzz n)
  (-> exact-integer? (listof string?))
  (map f (range 1 (+ n 1))))

(check-equal? (fizz-buzz 3) '("1" "2" "Fizz"))
