;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |1.|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct node (key val left right))
;; make-node is a Num Str BST BST

(define (bst-add abst k v)
  (cond [(empty? abst) (make-node k v empty empty)]
        [(= k (node-key abst))(make-node k v (node-left abst)
                                             (node-right abst))]
        [(> k (node-key abst)) (bst-add  (make-node (node-key abst)
                                         (node-val abst)
                                         (node-left abst)
                                         (bst-add (node-right abst) k v)) k v)]
        [(< k (node-key abst))(bst-add (make-node (node-key abst)
                                         (node-val abst)
                                         (bst-add (node-left abst) k v)
                                         (node-right abst)) k v)]))
                



(define my-123-bst (make-node 2 "two"
                              (make-node 1 "one" empty empty)
                              (make-node 3 "three" empty empty)))

;; Question 1a (my-123-bst is defined above)
(check-expect (bst-add (make-node 2 "two"
                                  (make-node 1 "one" empty empty)
                                  empty)
                       3 "three")
              my-123-bst)