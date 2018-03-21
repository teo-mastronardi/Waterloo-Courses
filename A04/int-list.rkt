;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname int-list) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;; Teo Mastronardi (20558296)
;; CS 135 Winter 2014
;; Assignment 04, Problem 2 (int-list)
;; ///////////////////////////////////////////////////


;; 2a)
;; (count-in-range lst low high) consumes a 
;;  listof Int (Int), and two integers (low and high)
;;   to produce the number of numbers within the given
;;    range (between low and high) of the given list

;; count-in-range: (listof Int) Int Int -> (listof Int)

;; Examples:
(check-expect (count-in-range (cons 3 (cons 1 (cons 2 (cons 5 empty ))))
                              2 6) 2)
(check-expect (count-in-range (cons 6 (cons 7 (cons 4 empty )))
                              1 4) 0)

(define (count-in-range lst low high)
  (cond   [(empty? lst) 0]
          [(and  (< low (first lst))
                 (> high (first lst)))
           (add1 (count-in-range (rest lst) low high))]
          [else (count-in-range (rest lst) low high)]))

;; Tests
(check-expect (count-in-range (cons 1 (cons 7 empty ))
                              1 3) 0) 
(check-expect (count-in-range (cons 3 (cons 5 (cons 12 empty )))
                              1 13) 3) 
(check-expect (count-in-range (cons 2 (cons 1 (cons 2 (cons 3 empty ))))
                              1 3) 2) 

;; 2b)
;; (base-up lst base) consumes a list of Intergers
;;  (lst) and a base integer (base) to produce a new
;;   list whose ith entry is the (base) rasied to the power
;;    of the ith entry of the original list.

;; base-up: (listof Int) Int -> (listof Int)
;; requires:
;; base != 0

;; Examples:
(check-expect(base-up (cons 1 (cons 2 (cons 3 empty))) 3)
             (cons 3 (cons 9 (cons 27 empty))))
(check-expect(base-up (cons 2 (cons 3 empty)) 2)
             (cons 4 (cons 8 empty)))


(define (base-up lst base)
  (cond [(empty? lst) empty]
        [else (cons (expt base (first lst)) (base-up (rest lst) base))]))

;; Tests:
(check-expect(base-up (cons 4 empty) 2)
             (cons 16 empty))
(check-expect(base-up (cons 1 (cons 2 empty)) 2)
             (cons 2 (cons 4 empty)))

;; 2c)
;; (descending? lst) consumes a list of integers (lst)
;;  and produces true if the order of the list is strictly
;;   decreasing and false otherwise

;; descending?: (listof Int) -> Bool

;; Examples:
(check-expect(descending? (cons 5 (cons 4 (cons 2 (cons 1 empty))))) true)
(check-expect (descending? (cons 7 (cons 2 (cons 31 (cons 1 empty)))))false)
 
(define (descending? lst)
  (cond [(empty? (rest lst)) true]
        [(> (first lst)(first(rest lst))) (descending? (rest lst))]
        [else false]))

(check-expect(descending? (cons 7 (cons 5 (cons 3 (cons 1 empty))))) true)
(check-expect (descending? (cons 3 (cons 5 (cons 2 (cons 1 empty)))))false)
(check-expect (descending? (cons 4 (cons 3 (cons 2 (cons 2 empty)))))false)

;; 2d)
;; (abs-diff lst) consumes a list of integer 
;;  and produces the sum of the absolute difference 
;;   between each pair of consecutive elements in the list.

;; abs-diff: (listof Int) -> Nat

(define (abs-diff lst)
  (cond 