#lang racket

(require "pq.rkt")

;; CS136 Spring 2015
;; Assignment 1, Problem 2

;; (theLounge) creates a Priority Que.

;; (addToQ) Consumes the Priority Que made from theLounge (pq)
;;  and determines who should be seated when a table becomes available
;;   when inserted a name with a position in que.
;; Once the lounge is full, the lounge closes.
;; addToQ: pq ->  (printf anyOf (seat (read))
;;															nobody to seat
;;															lounge closed)

;; IMPLEMENTATION ====================

(define (theLounge)
  (define pq (pq-new))
  (addToQ pq))


(define (addToQ pq)
  (define arrival? (read))
  (cond [(equal? arrival? 'arrive)
         (pq-insert pq (read)(read))
         (addToQ pq)]
        [(equal? arrival? 'close)
         (printf "lounge closed\n")]
        [(pq-empty? pq) (printf "nobody to seat\n")
         (addToQ pq)]
        [(equal? arrival? 'table)
         (printf "seat ~a\n" (pq-top pq))
         (pq-delete pq)
         (addToQ pq)]
        [else (printf "Invalid input! Please type either:\nArrive (name) 
                      (gratuity)\ntable\nclosed")(addToQ pq)]))


(theLounge)
