;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname sigmag) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;; Teo Mastronardi (20558296)
;; CS 135 Winter 2014
;; Assignment 05, Problem 3 (sigmag)
;; ///////////////////////////////////////////////////

;; 3a) 
(define-struct sigmag (sig mag))
;; A SigMag is a (make-sigmag Sym Num)
;; requires: sig is one of 'positive, 'negative, 'zero
;; * mag > 0
;; * if sig is 'zero, then mag = 1

;(define (my-sigmag-fn num)

;; 3b)

;; (num->sigmag num) consumes a number and 
;;  produces its SigMag value.

;; num->sigmag: Num -> SigMag

;; Examples:
(check-expect (num->sigmag 7)(make-sigmag 'positive 7))
(check-expect (num->sigmag -7)(make-sigmag 'negative 7))

(define (num->sigmag num)
  (cond [(negative? num) (make-sigmag 'negative (abs num))]
        [(positive? num) (make-sigmag 'positive num)]
        [(zero? num) (make-sigmag 'zero 1)]))

;; Tests:
(check-expect (num->sigmag 1)(make-sigmag 'positive 1))
(check-expect (num->sigmag 0)(make-sigmag 'zero 1))
(check-expect (num->sigmag -3)(make-sigmag 'negative 3))
(check-expect (num->sigmag -4)(make-sigmag 'negative 4))

;; (sigmag->num sgmg) consumes a sigmag and 
;;  produces its number value.

;; sigmag->num: SigMag -> Num

;; Examples:
(check-expect (sigmag->num (make-sigmag 'negative 6)) -6)
(check-expect (sigmag->num (make-sigmag 'positive 5)) 5)
 
(define (sigmag->num sgmg)
  (cond [(symbol=? 'positive (sigmag-sig sgmg))
         (sigmag-mag sgmg)]
        [(symbol=? 'negative (sigmag-sig sgmg))
         (* -1(sigmag-mag sgmg))]
        [(symbol=? 'zero (sigmag-sig sgmg))
         1]))
;; Tests:
(check-expect (sigmag->num (make-sigmag 'negative 8)) -8)
(check-expect (sigmag->num (make-sigmag 'positive 6)) 6)
(check-expect (sigmag->num (make-sigmag 'zero 1)) 1)

;; 3c)

;; (convert-sigmag-list lst) consumes a list of sigmags
;;  and produces a list of their number values.

;; convert-sigmag-list (listof SigMag) -> (listof Num)

;; Examples:
(check-expect (convert-sigmag-list (list (make-sigmag 'negative 4)
                                         (make-sigmag 'positive 3)))
              (list -4 3))
(check-expect (convert-sigmag-list (list (make-sigmag 'positive 5)
                                         (make-sigmag 'positive 20)))
              (list 5 20))
                             

(define (convert-sigmag-list lst)
  (cond [(empty? lst) empty]
        [(symbol=? 'positive (sigmag-sig (first lst)))
         (cons (sigmag-mag (first lst))
               (convert-sigmag-list (rest lst)))]
        [(symbol=? 'negative (sigmag-sig (first lst)))
         (cons (* -1(sigmag-mag (first lst)))
               (convert-sigmag-list (rest lst)))]
        [(symbol=? 'zero (sigmag-sig (first lst)))
         (cons 1 (convert-sigmag-list (rest lst)))]))

;; Tests:
(check-expect (convert-sigmag-list (list )) (list ))
(check-expect (convert-sigmag-list (list (make-sigmag 'negative 4)
                                         (make-sigmag 'positive 3)
                                         (make-sigmag 'zero 1)))       
              (list -4 3 1))

;; 3d)

;; (count-sigmag a b) consumes two integers (a b)
;;  and produces a list of SigMag structures representing
;;   the integers a, a+1,..., b. 

;; count-sigmag: Int Int -> (listof SigMag)

;; Examples:
(check-expect (count-sigmag 0 2)
              (list (make-sigmag 'zero 1)
                    (make-sigmag 'positive 2)))
(check-expect (count-sigmag -1 1)
              (list (make-sigmag 'negative 1)
                    (make-sigmag 'positive 1)))


(define (count-sigmag a b)
  (cond [(> a b) empty]
        [(and (zero? a)(positive? b))
         (cons (make-sigmag 'zero 1)
               (cons (make-sigmag 'positive b)empty))]
        [(and (positive? a)(positive? b))
         (cons (make-sigmag 'positive a)
               (cons (make-sigmag 'positive b)empty))]
        [(and (negative? a)(negative? b))
         (cons (make-sigmag 'negative (abs a))
               (cons (make-sigmag 'negative (abs b))empty))]
        [(and (negative? a)(positive? b))
         (cons (make-sigmag 'negative (abs a))
               (cons (make-sigmag 'positive b)empty))]
         [(and (negative? a)(zero? b))
         (cons (make-sigmag 'negative (abs a))
               (cons (make-sigmag 'zero 1)empty))]
         [else (cons (make-sigmag 'zero 1)
                     (cons (make-sigmag 'zero 1) empty))]))
;; Tests:
(check-expect (count-sigmag -1 -2)
              (list ))
(check-expect (count-sigmag 1 0)
              (list ))
(check-expect (count-sigmag -1 0)
              (list (make-sigmag 'negative 1)
                    (make-sigmag 'zero 1)))
(check-expect (count-sigmag 1 2)
              (list (make-sigmag 'positive 1)
                    (make-sigmag 'positive 2)))
(check-expect (count-sigmag 1 1)
              (list (make-sigmag 'positive 1)
                    (make-sigmag 'positive 1)))
(check-expect (count-sigmag -2 -1)
              (list (make-sigmag 'negative 2)
                    (make-sigmag 'negative 1)))
(check-expect (count-sigmag 0 0)
              (list (make-sigmag 'zero 1)
                    (make-sigmag 'zero 1)))

        
        
         