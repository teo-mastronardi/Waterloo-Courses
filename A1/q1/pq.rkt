#lang racket

(provide pq-insert)
(provide pq-new)
(provide pq-top)
(provide pq-delete)
(provide pq-empty?)
;; CS136 Fall 2015
;; Assignment 1, Problem 1


;; pq-new creates a new priority queue as a
;;  a list so it can be used to create Association Lists


;; (pq-insert pq-new elem prio) creates a priority 
;;  queue, consumes a name (elem) and a Number in 
;;  the que (prio) and inserts a elem and prio into
;;   the Queue.
;; pq-insert: (listof list) Sym Nat -> listof (List)


;; (pq-top pq)returns the element with the highest priority in
;;  the que.
;; pq-top: (listof (Nat Sym)) -> Sym
;; requires: pq to be non-empty


;; (pq-delete pq) produces a new priority queue with all the same elements
;;  as pq except for the highest element in the que.
;; pq-delete: (listof (Nat Sym)) -> (listof (Nat Sym)) 
;; requires: pq to be non-empty

;; IMPLEMENTATION ====================

;; Refer to Interface for details
(define (pq-new)
  empty)


;; Refer to Interface for details
(define (pq-insert pq-new elem prio)
  (pq-sort pq-new (list prio elem)))

;; (pq-sort pq dict) consumes a Priority Queue(pq) and
;;  a dictionary (dict) which contains an element and 
;;   a que number to be added to pq.

;;pq-sort: (anyof (list) (listof Nat Sym)) (listof Nat Sym)
;;                              -> (listof listof(Nat Sym))

(define (pq-sort pq dict)
  (cond [(empty? pq) (list dict)]
        [(> (first (first pq))
            (first dict))
         (cons (first pq) (pq-sort (rest pq) dict))]
        [(< (first(first pq))
            (first dict))
         (cons dict pq)]
        [else (cons (first pq)(pq-sort (rest pq) dict))]))


;; Refer to Interface for details
(define (pq-top pq)
  (second (first pq)))

;; Refer to Interface for details
(define (pq-delete pq)
  (rest pq))

;; Refer to Interface for details
(define (pq-empty? pq)
  (empty? pq))

         
                                
         




 
