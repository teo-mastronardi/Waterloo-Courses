;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname pizza) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;; Teo Mastronardi (20558296)
;; CS 135 Winter 2014
;; Assignment 02, Problem 4 (pizza-price)
;; ///////////////////////////////////////////////////


;;Constants:
(define small 6)
(define medium 8)
(define large 9.50)
(define (st x)
  (* 1 x))
(define (pt x)
  (* 1.5 x))


;; (pizza-price size sdt pmt coup) consumes a pizza
;;  that contains the size of the pizza (size), 
;;   standard topping (sdt), premium topping (pmt) 
;;    and a coupon (coup). 
;; The function then produces the correct price for
;;  the specific characteristics of the pizza.

;; pizza-price: Sym Nat Nat Sym -> Num

;; Examples:
(check-expect (pizza-price 'large 1 2 'supersize) 10)
(check-expect (pizza-price 'large 1 2 'supersize) 10)

(define (pizza-price size sdt pmt coup)
  (cond [(symbol=? coup 'big-eater) 18]
        [(symbol=? size 'small)
         (cond [(symbol=? coup 'half-off)
                (* (+ small (st sdt)(pt pmt)) .5)]
               [(and (symbol=? coup 'solo) (= pmt 2)
                     (= sdt 0)) 8]
               [else (+ small (st sdt)(pt pmt))])]
        
        [(symbol=? size 'medium)
         (cond [(symbol=? coup 'half-off)
                (* (+ medium (st sdt)(pt pmt)) .5)]
               [(symbol=? coup 'supersize)
                (+ small (st sdt)(pt pmt))]
               [else (+ medium (st sdt)(pt pmt))])]
        
        [(symbol=? size 'large)
         (cond [(symbol=? coup 'half-off)
                (* (+ large (st sdt)(pt pmt)) .5)]
               [(symbol=? coup 'supersize)
                (+ small (st sdt)(pt pmt))]
               [else (+ large (st sdt)(pt pmt))])]))

;;Tests:
(check-expect (pizza-price 'large 300 500 'big-eater) 18)
(check-expect (pizza-price 'large 2 2 'half-off) 7.25)
(check-expect (pizza-price 'large 2 3 'supersize) 12.5)
(check-expect (pizza-price 'large 1 0 'none) 10.5)
(check-expect (pizza-price 'large 2 1 'THISISNOTACOUPON) 13)
(check-expect (pizza-price 'medium 1 2 'half-off) 6)
(check-expect (pizza-price 'medium 1 1 'none) 10.5)
(check-expect (pizza-price 'medium 0 1 'THISISNOTACOUPON) 9.5)
(check-expect (pizza-price 'medium 3 21 'big-eater) 18)
(check-expect (pizza-price 'medium 3 2 'supersize) 12)
(check-expect (pizza-price 'small 3 2 'half-off) 6)
(check-expect (pizza-price 'small 2 0 'none) 8)
(check-expect (pizza-price 'small 2 4 'THISISNOTACOUPON) 14)
(check-expect (pizza-price 'small 444443 3441 'big-eater) 18)
(check-expect (pizza-price 'small 0 2 'solo) 8)
(check-expect (pizza-price 'small 2 4 'solo) 14)