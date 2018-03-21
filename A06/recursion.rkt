;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname recursion) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; (after-n n v los) consumes a natural number (n),
;;  a symbol (v) and a list of symbols (los).
;; It produces the list of symbols which occure after 
;;  the nth occurrence (n) of a symbol (v).

;; after-n: Nat Sym (lstof Sym) -> (lstof Sym)

;; Examples:
(check-expect (after-n 2 'b '(b a b e n d)) '(e n d))
(check-expect (after-n 1 'b '(a b h i t a)) '(h i t a))
                      
(define (after-n n v los)
  (cond [(= 0 n) los]
        [(symbol=? v (first los)) (after-n (sub1 n) v (rest los))]
        [else (after-n n v (rest los))]))

;; Tests:
(check-expect (after-n 0 'b '(h a e o u q)) '(h a e o u q))
(check-expect (after-n 3 'a '(a a a a a a)) '(a a a))
(check-expect (after-n 1 'n '(b a b e n d)) '(d))

;; B)

;; (list-posn loloi pos) consumes a list of list 
;;  of integers (loloi) and a Posn (pos). 
;; Produce an integer that is the yth element of the
;;  xth list in loloi. If that does not exists, produces
;;  false.

;; list-posn: (listof (listof Int)) Posn -> (anyof Int Bool)
;; requires:
;; * Posn with both x y being positive integers.

;; Examples:
(check-expect(list-posn '((2 1 3) (4 5))(make-posn 2 2)) 5)
(check-expect(list-posn '((2 1 3) (4 5 6))(make-posn 2 3)) 6)

(define (list-posn loloi pos)
  (cond [(empty? loloi) false]
        [(and (= 1 (posn-y pos))(zero? (posn-x pos)))
         (first loloi)]
        [(zero? (posn-x pos))
         (list-posn (rest loloi)(make-posn 0 (sub1 (posn-y pos))))]
        [(= 1 (posn-x pos))
         (list-posn (rest(first loloi))(make-posn (sub1(posn-x pos))(sub1 (posn-y pos))))]
        [else (list-posn (rest loloi) (make-posn (sub1 (posn-x pos)) (posn-y pos)))]))

;; Tests:
(check-expect(list-posn '((2 1 3) (4 5))(make-posn 2 3)) false)
(check-expect(list-posn '((2 1 3) (4 5) (1 3 5))(make-posn 3 3)) 5)
(check-expect(list-posn '()(make-posn 2 2)) false)
(check-expect(list-posn '((1 2 3) (4 5 6))(make-posn 1 2)) 2)


;; C)

;; (every-nth lst n) consumes a list (lst)
;;  and a positive integer (n) and produces a
;;   list containing every nth element from the
;;    original list. 

;; every-nth: (listof Num) -> (listof Num)
;; requires: 
;; * n to be a positive integer

;; Examples:
(check-expect(every-nth '(1 2 3 4 5) 2) '(2 4))
(check-expect(every-nth '(1 2 3 4 5 6) 7)'())

(define (every-nth lst n)
  (cond [(empty? lst) empty]
        [(integer? (/ (first lst) n))
         (cons (first lst) (every-nth (rest lst) n))]
        [else (every-nth (rest lst) n)]))

;; Tests:
(check-expect(every-nth '(1 2 3 4 5 6 7 8 9) 3) '(3 6 9))
(check-expect(every-nth '(1 2 3 4 5 6 7 8 9) 2) '(2 4 6 8))
(check-expect(every-nth '(1 2 3 4 5) 1) '(1 2 3 4 5))
(check-expect(every-nth '() 1)'())

;; D)

;; (mult-score alist clist) consumes 2 lists,
;;  the first list (alist) is the responses and 
;;   the second list (clist) is the correct answers.

;; mult-score: (listof Sym)(listof Sym) -> Nat
;; requires: 
;; * both lists to be of the same size
;; * alist containts either ('A 'B 'C 'D 'E or 'blank)
;; * clist containts either ('A 'B 'C 'D 'E)

;; Examples:
(check-expect(mult-score '(A B blank D) '(B B B D)) 12)
(check-expect(mult-score '(A B blank D) '(A B C D)) 17)

(define (mult-score alist clist)
  (cond [(empty? alist) 0]
        [(symbol=? (first alist) (first clist))
         (+ 5 (mult-score (rest alist) (rest clist)))]
        [(symbol=? (first alist) 'blank) 
         (+ 2 (mult-score (rest alist) (rest clist)))]
        [else (mult-score (rest alist) (rest clist))]))

;; Tests:
(check-expect(mult-score '() '()) 0)
(check-expect(mult-score '(C B E D) '(A B C A)) 5)
(check-expect(mult-score '(A C D E) '(A B C E)) 10)
(check-expect(mult-score '(blank blank blank D) '(A B C D)) 11)
