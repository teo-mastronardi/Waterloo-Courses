;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname participation) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; 2a)
;; (occurrences lst num) consumes a list of Numbers
;;  (lst) and a Number (num) and determines how many
;;   occurences of (num) are in (lst).

;; occurrences: (listof Num) Num -> Nat

;; Examples:
(check-expect (occurrences(list 1 2 3 4 5 6 7)3) 1)
(check-expect (occurrences(list 2 2 2 2 2)2) 5)

(define (occurrences lst num)
  (cond [(empty? lst) 0]
        [(= num (first lst)) (add1 (occurrences (rest lst) num))]
        [else (+ 0 (occurrences (rest lst) num))]))

;; Tests:
(check-expect (occurrences(list 1 2 3 4 4 4 4)4) 4)
(check-expect (occurrences(list 1 2 3 4 5 6 7)8) 0)
(check-expect (occurrences(list 0)0) 1)
(check-expect (occurrences(list )0) 0)

;; 2b)
;; (participation lst) consumes a list of numbers
;;  (lst) and produces a number from 0-5 that represents
;;   the total participation mark.

;; participation: (lstof Int) -> Num
;; requires: Numbers to be 0,1,2

;;Examples:

(define (participation lst)  
  3.75)


