;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |2|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; (tallest los lon) consumes a list of
;;  symbols (los) and a list of numbers 
;;   (lon) to produce the name of the student
;;    who is the tallest.

;; tallest: (listof Sym) (listof Num) -> Sym
;; requires: 
;; * (lon are positive numbers)
;; * both los and lon are non empty
;;   and same length

;; Examples:
;(check-expect (tallest '(Bernie Raj Amy)
                       ;'(1.5 1.7 1.6)) 'Raj)

;(define (tallest los lon)
 ; (cond [(> (first lon)(first(rest lon)))

;;(shortest los lon) consumes a list of
;;  symbols (los) and a list of numbers 
;;   (lon) to produce the name of the student
;;    who is the shortest.

;; shortest (listof Sym) (listof Num) -> Sym
;; requires: 
;; * (lon are positive numbers)
;; * both los and lon are non empty
;;   and same length

(define (shortest los lon)
  (cond [(empty? (rest los)) (first los)]
        [(< (first lon)(first(rest lon)))
         (current-max (rest los) (rest lon)
                         (first los) 
                         (first lon))]
        [else (shortest (rest los)(rest lon))]))

;; (current-max los lon accs accn) consumes
;;  a list of names (los) a list of numbers (lon)
;;   a Symbol (accs) and a Number (accn) and determines
;;    the smallest number to its corresponding symbol.

;; current-max: (listof Sym)(listof Num) Sym Num -> Sym
;; requires: 
;; * los lon are same length

(define (current-max los lon accs accn)
  (cond [(empty? (rest lon)) accs]
        [(< accn (first lon))(current-max (rest los)(rest lon)
                                            accs accn)]
        [else (current-max los lon (first los)
                      (first lon))]))
         
         (shortest '(Bernie Raj Amy phil)
                       '(1.5 1.3 1.4 1))
         