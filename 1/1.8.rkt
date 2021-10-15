#lang racket

(define (square x) (* x x))

(define (improve guess x)
  (/ (+ (/ x
           (square guess))
        (* 2 guess))
     3))

(define (good-enough? guess x)
  (< (/ (abs (- guess
                (improve guess x)))
        guess)
     0.001))

(define (cbrt-iter guess x)
  (if (good-enough? guess x) guess
      (cbrt-iter (improve guess x) x)))

(define (cbrt x) (cbrt-iter (/ x 2.0) x))
