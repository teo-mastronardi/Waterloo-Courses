;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname nest) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;; Teo Mastronardi (20558296)
;; CS 135 Winter 2014
;; Assignment 7, Problem 2 (nest)
;; ///////////////////////////////////////////////////

;; (max-nest ns) consumes a Nested List of Numbers (ns)
;;  to produce the maximum number of nested lists in ns.

;; max-nest: Nest-List-Num -> Nat

;; Examples:
(check-expect(max-nest (list 1 (list 2))) 2)
(check-expect(max-nest '(((99)) (2)((8))4 6)) 3)


(define (max-nest ns)
  (cond [(empty? ns) 1]
        [(number? (first ns)) (max-nest (rest ns))]
        [else (max (add1 (how-many (first ns)))(max-nest(rest ns)))]))

;; Tests
(check-expect(max-nest (list(list 1)  (list(list 2)))) 3)
(check-expect(max-nest '((3) (2)((8))4 6))3)
(check-expect(max-nest '())1)
(check-expect(max-nest (list (list 1) (list 2)))2)

;; (how-many lst) consumes a Nested List of numbers 
;;  and determines how many lists are within lst.

;; how-many: (anyof Nest-List-Num (listof Num) empty) -> Nat

;;Examples:
(check-expect(how-many (list(list 1))) 2)
(check-expect(how-many  (list (list 4 (list 3))))2)

(define (how-many lst)
  (cond [(empty? lst) 1]
        [(number? (first lst)) 1]
        [else (add1 (how-many (rest lst)))]))

;; Tests:
(check-expect(how-many '()) 1)
(check-expect(how-many (list 1))1)
