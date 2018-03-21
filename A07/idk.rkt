;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname idk) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct node (key val left right))

(define my-123-bst (make-node 2 "two"
                              (make-node 1 "one" empty empty)
                              (make-node 3 "three" empty empty)))




(define (bst-full? abst)
  (cond [(empty? abst) true]
        [(and (empty? (node-left abst))
              (empty? (node-right abst)))
         (make-node (node-key abst)(node-val abst)
                    (bst-full? (node-left abst))
                    (bst-full? (node-right abst)))]
        [(and (not(empty? (node-left abst)))
              (not(empty? (node-right abst))))
         (make-node (node-key abst)(node-val abst)
                    (bst-full? (node-left abst))
                    (bst-full? (node-right abst)))]
        [else false]))

(check-expect (bst-full? my-123-bst) true)