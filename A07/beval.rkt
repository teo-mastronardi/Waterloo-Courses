;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname beval) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;; Teo Mastronardi (20558296)
;; CS 135 Winter 2014
;; Assignment 7, Problem 4 (beval)
;; ///////////////////////////////////////////////////

;; A boolean expression (Bexp) is one of: 
;; * a Boolean value (true or false)
;; * a comparison expression (Cexp)
;; * a compound boolean expression (Cbexp)

(define-struct cexp (fn arg1 arg2))
;; A Cexp is a (make-cexp (anyof '> '< '=) Num Num)

(define-struct cbexp (op args))
;; A Cbexp is a (make-cbexp (anyof 'and 'or) Cbexplist)

;; A Cbexplist is one of:
;; * empty 
;; * (cons Bexp Cbexplist)


;; Templates (part (a))

(define (my-Bexp-fn bexp)
  (cond [(symbol=? ' bexp)...]
        [(cbexp? bexp)...]))

(define (my-cexp-fn bexp)
  (cond [(symbol=? '> (cexp-fn bexp))...]
        [(symbol=? '< (cexp-fn bexp))...]
        [else (= (cexp-arg1 bexp)(cexp-arg2 bexp))]))


(define (my-cbexp-fn bexp)
  (cond [(symbol=? 'and (cbexp-op bexp))...]
        [(symbol=? 'or (cbexp-op bexp))...]
        [(cons? (cbexp-args bexp))
         (my-cbexplist-fn (... bexp))]))

(define (my-cbexplist-fn bexp)
  (cond [(cexp? (first bexp))...]
        [(cbexp? (first bexp))...]))

;; bool-eval (part (b))

;; (bool-eval bexpr) consumes a Bexpr and produces
;;  a boolean value of the boolean expression based on 
;;   evaluation rules

;; bool-eval: Bexpr -> Bool

;; Examples:

(define (bool-eval bexpr)
  (cond [(cexp? bexpr)(c-eval bexpr)]
        [else (cb-eval bexpr)]))

;; Tests:
(check-expect (bool-eval (make-cexp '< 4 7)) true)
(check-expect (bool-eval (make-cexp '= 4 7)) false)
(check-expect (bool-eval (make-cbexp 'and (list (make-cexp '< 3 4)))) true)
(check-expect(bool-eval (make-cbexp 'and 
                                    (list (make-cexp '> 5 2) true true))) true)
(check-expect(bool-eval (make-cbexp 'or 
                                    (list (make-cexp '< 5 2) false true))) false)
(check-expect(bool-eval (make-cbexp 'and empty)) false)

;; (c-eval bexpr) consumes a bexpr and deals
;;  stricly with cexp.

;; c-eval: Bexpr -> Bool

(define (c-eval bexpr)
  (cond [(symbol=? '> (cexp-fn bexpr))
         (> (cexp-arg1 bexpr)(cexp-arg2 bexpr))]
        [(symbol=? '< (cexp-fn bexpr))
         (< (cexp-arg1 bexpr)(cexp-arg2 bexpr))]
        [else (= (cexp-arg1 bexpr)(cexp-arg2 bexpr))]))

;; (cb-eval bexpr) consumes a bexpr and deals
;;  stricly with cbexp.

;; cb-eval: Bexpr -> Bool

(define (cb-eval bexpr)
  (cond [(empty? (cbexp-args bexpr)) false]
        [(cons? (cbexp-args bexpr))
         (bool-eval (first (cbexp-args bexpr)))]
        [(symbol=? 'and (cbexp-op bexpr))
         (cons (and true true) (cbexp-args bexpr))]
        [(symbol=? 'or (cbexp-op bexpr))
         (cons (or false false) (cbexp-args bexpr))]))
