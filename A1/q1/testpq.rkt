#lang racket
;; File test.rkt
;;Enter a description for this file.

(require "pq.rkt")

(equal? (pq-insert (pq-new) 'Tina 50) '((50 Tina)))
(equal? (pq-insert (pq-new) 'Napoleon 30)'((30 Napoleon)))
(equal? (pq-insert(pq-insert (pq-new) 'Tina 5) 'me 0) '((5 Tina) (0 me)))
(equal? (pq-insert(pq-insert (pq-new) 'Napsauce 5) 'me 10)
        '((10 me) (5 Napsauce)))
(equal? (pq-insert(pq-insert(pq-insert (pq-new) 'Napsauce 5) 'P-diddy 5) 'me 10)
'((10 me) (5 Napsauce) (5 P-diddy)))
(equal? (pq-insert(pq-insert(pq-insert (pq-new) 'Napsauce 5) 'P-diddy 25) 'me 10)
'((25 P-diddy) (10 me) (5 Napsauce)))


(equal? 
 (pq-top(pq-insert(pq-insert (pq-new) 'Tina 5) 'me 0)) 'Tina)
(equal? 
 (pq-top (pq-insert(pq-insert(pq-insert (pq-new) 'Napsauce 5) 'P-diddy 5) 'me 10))
 'me)
(equal? 
 (pq-delete (pq-insert(pq-insert(pq-insert (pq-new) 'Napsauce 5) 'P-diddy 5) 'me 10))
 '((5 Napsauce) (5 P-diddy)))
(equal? 
 (pq-empty?(pq-insert(pq-insert(pq-insert (pq-new) 'Napsauce 5) 'P-diddy 5) 'me 10))
#f)
(equal? 
 (pq-empty? (pq-new))#t)
 
 
