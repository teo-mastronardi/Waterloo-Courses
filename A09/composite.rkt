;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname composite) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;; Teo Mastronardi (20558296)
;; CS 135 Winter 2014
;; Assignment 9, Problem 3 (composite)
;; ///////////////////////////////////////////////////

;; 3A)
;; (composite f g) consumes a function f and g
;;  and computes f(g(x)) for any given x.

;; composite: (anyof (Num -> Num)(Num -> (listof Num))
;;            (anyof (Num -> Num)(Num -> (listof Num)) -> 
;;            (anyof (Num -> Num)(Num -> (listof Num))

;; Examples:
(check-expect ((composite abs add1) -5) 4)
(check-expect ((composite sqrt add1) 8) 3)

(define(composite f g)
  (lambda (x)(f(g x))))

;; Tests:
(check-expect ((composite sqr sqr) 2) 16)
(check-expect ((composite list list) 8) (list(list 8)))
(check-expect ((composite first list) 5) 5)

;; (inverse-of-square-list lon) consumes a list of numbers
;;  (lon) and produces the inverse and square of each value
;;   in the list.

;; inverse-of-sqaure-list: (listof Num) -> (listof Num)

;; Examples:
(check-expect (inverse-of-square-list '(1 2)) '(1 1/4)) 
(check-expect (inverse-of-square-list '(5 3 2 )) '(1/25 1/9 1/4)) 

(define (inverse-of-square-list lon)
   (foldr(lambda (f rrr)(cons ((composite sqr identity)(/ 1 f))rrr))
         empty lon))

;; Tests:
(check-expect (inverse-of-square-list '(1 3 4)) '(1 1/9 1/16))      
(check-expect (inverse-of-square-list '(1 2 5 6 7)) '(1 1/4 1/25 1/36 1/49))
(check-expect (inverse-of-square-list '(1 4 2 3)) '(1 1/16 1/4 1/9))


;; (composite-list lof) consumes a list of functions
;;  that will be applied to the number

;; composite-list: (listof (Num-> Num)) -> Num

;; composite-list:
(check-expect ((composite-list (list add1 sqr sub1)) 3) 5)
(check-expect ((composite-list (list abs sub1 sub1 sub1)) 0) 3)

(define (composite-list lof)
  (lambda (x) (foldr (lambda (f rrr) (f rrr)) x lof))) 

;; Tests:
(check-expect ((composite-list (list sqr add1 add1)) 3) 25)
(check-expect ((composite-list (list sub1)) 2) 1)
(check-expect ((composite-list (list sub1 add1 sub1 sqr)) 1) 0)