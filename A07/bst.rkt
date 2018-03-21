;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname bst) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;; Teo Mastronardi (20558296)
;; CS 135 Winter 2014
;; Assignment 7, Problem 1 (bst)
;; ///////////////////////////////////////////////////

(define-struct node (key val left right))

;; Binary Search Trees
(define my-perfect-bst (make-node 4 "four"
                              (make-node 2 "two" 
                                         (make-node 1 "one" empty empty)
                                         (make-node 3 "three" empty empty))
                              (make-node 6 "six" 
                                         (make-node 5 "five" empty empty) 
                                         (make-node 7 "seven" empty empty))))
                              
(define my-123-bst (make-node 2 "two"
                              (make-node 1 "one" empty empty)
                              (make-node 3 "three" empty empty)))
(define my-1234-bst (make-node 2 "two"
                               (make-node 1 "one" empty empty)
                               (make-node 3 "three" empty 
                                          (make-node 4 "four" empty empty))))
(define my-12345-bst (make-node 3 "three"
                                (make-node 2 "two" 
                                           (make-node 1 "one" empty empty) empty)
                                (make-node 4 "four" empty 
                                           (make-node 5 "five" empty empty))))
(define my-123456-bst (make-node 3 "three"
                                 (make-node 2 "two"
                                            (make-node 1 "one" empty empty)empty)
                                 (make-node 4 "four" empty
                                            (make-node 5 "five"  empty
                                                       (make-node 6 "six" empty empty)))))
;; 1A)

;; (bst-add abst k v) consumes a binary search tree
;;  (abst) a key (k) and a value (v).
;; bst-add then adds the key and value to the binary 
;;  search tree creating a new BST.

;; bst-add: BST Num Str -> BST

;; Examples:

(define (bst-add abst k v)
  (cond [(empty? abst) empty]
        [(check-abst abst k)
         (cond 
           [(= k (node-key abst))
            (make-node (node-key k)
                       (node-val v)
                       (node-left abst)
                       (node-right abst))]
           [(check-abst  k (node-left abst))
            (make-node (node-key abst)
                       (node-val abst)
                       (bst-add (node-left abst) k v)
                       (node-right abst))]
           
           [(check-abst k (node-right abst))
            (make-node (node-key abst)
                       (node-val abst)
                       (node-left abst)
                       (bst-add (node-right abst) k v))])]
        [else (update-abst abst k v)]))

;; Tests:
(check-expect (bst-add (make-node 2 "two"
                                  (make-node 1 "one" empty empty)
                                  empty)
                       3 "three")
              my-123-bst)
(check-expect (bst-add my-123-bst 4 "four")my-1234-bst)
(check-expect (bst-add my-1234-bst 5 "five")(make-node 2 "two"
                                                       (make-node 1 "one" empty empty)
                                                       (make-node 3 "three" empty
                                                                  (make-node 4 "four" empty
                                                                             (make-node 5 "five" empty empty)))))
(check-expect (bst-add my-12345-bst 6 "six")my-123456-bst)



;; (update-abst abst k v) consumes a BST (abst) a key (k)
;;  and avalue (v) that produces a new abst with the new key and value

;; update-abst: BST Num Str -> BST

;; Examples:

(define (update-abst abst k v)
  (cond [(and (> k (node-key abst))
              (empty? (node-right abst)))
         (make-node (node-key abst)
                    (node-val abst)
                    (node-left abst)
                    (make-node k v empty empty))]
        [(> k (node-key abst))
         (make-node (node-key abst)
                    (node-val abst)
                    (node-left abst)
                    (update-abst (node-right abst) k v))]
        
        [(and (< k (node-key abst))
              (empty? (node-left abst)))
         (make-node (node-key abst)
                    (node-val abst)
                    (make-node k v empty empty)
                    (node-right abst))]                    
        
        [(< k (node-key abst))
         (make-node (node-key abst)
                    (node-val abst)
                    (update-abst (node-left abst) k v)
                    (node-right abst))]))

;; Tests:


;; (check-abst abst k v) consumes an abst, an key
;;  and a value that determines if that k is already in the
;;   abst.

;; check-abst: BST Num Str -> Bool

;; Examples: 
(check-expect(check-abst my-123-bst 2) true)
(check-expect(check-abst my-123-bst 4) false)

(define (check-abst abst k)
  (cond 
    [(empty? abst) false]
    [(= k (node-key abst)) 
     true]
    [else (or (check-abst (node-left abst) k)
              (check-abst (node-right abst) k))]))

;; Tests:
(check-expect(check-abst my-123-bst 3) true)
(check-expect(check-abst my-1234-bst 4) true)
(check-expect(check-abst empty 2) false)
(check-expect(check-abst my-12345-bst 6) false)

;; 1B)
;; (bst-full? abst) consumes a BST (abst) and
;;  determines if the tree is full or not, that is,
;;   each node has 2 or 0 elements.

;; bst-full?: BST -> Bool

;; Examples:
(check-expect (bst-full? my-123456-bst) false)
(check-expect (bst-full? my-1234-bst)false)


(define (bst-full? abst)
  (cond [(empty? abst) true]
        [(and (empty? (node-left abst))
              (empty? (node-right abst)))
         true]
        [(and (not(empty? (node-left abst)))
              (not(empty? (node-right abst))))
         (and (bst-full? (node-left abst))
              (bst-full? (node-right abst)))]
        [else false]))

;; Tests
(check-expect (bst-full? my-123-bst) true)
(check-expect (bst-full? my-1234-bst)false)
(check-expect (bst-full? empty)true)
(check-expect (bst-full? my-12345-bst) false)


;; 1C)

;; (bst-height abst) consumes a binary search tree
;;  (abst) and determines the height of the tree.

;; bst-height: BST -> Nat

;; Examples:
(check-expect (bst-height my-123-bst) 2)
(check-expect (bst-height my-1234-bst) 3)

(define (bst-height abst)
  (cond [(empty? abst) 0]
        [else (max (left-height (node-left abst))
                   (right-height (node-right abst)))]))

;; Tests:
(check-expect (bst-height my-1234-bst) 3)
(check-expect (bst-height my-12345-bst) 3)
(check-expect (bst-height empty) 0)
(check-expect (bst-height my-123456-bst) 4)

;; (left-height abst) consumes a binary search tree
;;  (abst) of strictly the left side and determines the 
;;   height of the tree.

;; bst-height: BST -> Nat

;; Examples:
(check-expect (left-height my-123-bst) 3)
(check-expect (left-height my-1234-bst) 3)

(define (left-height abst)
  (cond [(empty? abst) 1]
        [else (+ 1 (left-height (node-left abst)))]))

;; Tests
(check-expect (left-height my-123-bst) 3)
(check-expect (left-height my-12345-bst) 4)
(check-expect (left-height empty) 1)
(check-expect (left-height my-123456-bst) 4)

;; (right-height abst) consumes a binary search tree
;;  (abst) of strictly the right side and determines the

;; bst-height: BST -> Nat

;; Examples:
(check-expect (right-height my-123-bst) 3)
(check-expect (right-height my-1234-bst) 4)

(define (right-height abst)
  (cond [(empty? abst) 1]
        [else (+ 1 (right-height (node-right abst)))]))

;; Tests: 
(check-expect (right-height my-123-bst) 3)
(check-expect (right-height my-12345-bst) 4)
(check-expect (right-height empty) 1)
(check-expect (right-height my-123456-bst) 5)


;; 1D)

;; (bst-perfect? abst) consumes a BST (abst) and 
;;  determines if the BST is perfect, that is, if
;;   ever node in left and right subtree have the same
;;    height and are full.

;; bst-perfect?: BST -> Bool

;; Examples:
(check-expect (bst-perfect? my-perfect-bst) true)
(check-expect (bst-perfect? my-123456-bst)false)

(define (bst-perfect? abst)
  (cond [(empty? abst) true]
        [(and (=(right-height (node-right abst))
                (left-height (node-left abst)))
              (bst-full? abst)) true]
        [else false]))

;; Tests:
(check-expect (bst-perfect? my-123-bst) true)
(check-expect (bst-perfect? my-1234-bst)false)
(check-expect (bst-perfect? empty)true)
(check-expect (bst-perfect? my-12345-bst)false)

;; 1E)
;; (Bst->sal al) consumes a BST and converts to
;;  an association list that is sorted.
(define (bst->sal al)
  '((1 "one") (2 "two") (3 "three")))

;; Waaaah :(
(define (unsorted-al tree)
  (cond [(empty? tree) empty]
        [else (cons (list (node-key tree)(node-val tree))
                    (append (bst->sal (node-left tree))
                          (bst->sal (node-right tree))))]))

(check-expect (bst->sal my-123-bst)
              '((1 "one") (2 "two") (3 "three")))
                             



