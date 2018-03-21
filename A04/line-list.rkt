;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname line-list) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;; Teo Mastronardi (20558296)
;; CS 135 Winter 2014
;; Assignment 04, Problem 3 (line-list)
;; ///////////////////////////////////////////////////

;; 3a)
(define-struct line(slope intercept))
;; A Line is a (anyof Num 'Undefined) Num

(define (my-listof-line-fn lst)
  (... (line-slope lst)...
       (line-intercept lst)...))

;;Constant***************************************************
(define line1 (make-line 1 0))
(define line2 (make-line 0 3))
(define line3 (make-line -1/2 -2))
(define line4 (make-line 'undefined -4))
(define line5 (make-line 1 3))
(define line6 (make-line 'undefined 6))
(define line-list (cons line1 
                        (cons line2 (cons line3 
                                          (cons line4 empty)))))
(define line-list1 (cons line1 (cons line4 empty)))
(define line-list2 (cons line1 (cons line2 (cons line4 empty))))

;;************************************************************
;; 3B)
;; (negate-slope lst) consumes a list of Lines
;;  and negates the slope

;; negate-slope: (listof Line) -> (listof Line)

;; Examples:
(check-expect (negate-slope line-list1) 
              (cons (make-line -1 0) (cons (make-line 'undefined -4)empty)))
(check-expect (negate-slope line-list2) 
              (cons (make-line -1 0)(cons (make-line 0 3) 
                                          (cons (make-line 'undefined -4)empty))))


(define (negate-slope lst)
  (cond [(empty? lst) empty]
        [(symbol? (line-slope (first lst)))
         (cons (make-line 'undefined
                          (line-intercept (first lst)))
               (negate-slope (rest lst)))]
        [else (cons 
               (make-line
                (* (line-slope (first lst)) -1) 
                (line-intercept (first lst)))
               (negate-slope (rest lst)))]))

;; Tests:
(check-expect (negate-slope line-list)
              (cons(make-line -1 0)(cons (make-line 0 3)
                                         (cons(make-line 0.5 -2) 
                                              (cons (make-line 'undefined -4) empty)))))
(check-expect (negate-slope (cons line1 (cons line2 empty)))
              (cons
               (make-line -1 0)
               (cons (make-line 0 3) empty)))

;; C)

;; (positive-line lst) consumes a list of Line and
;;  produces a list of those Lines which have either
;;   a positive Slope or positive Intercept.

;; positive-line: (listof Line) -> (listof Line)

;;Examples:
(check-expect (positive-line line-list)
              (cons (make-line 1 0) (cons (make-line 0 3) empty)))
(check-expect (positive-line line-list2)
              (cons
               (make-line 1 0)
               (cons (make-line 0 3) empty))) 

(define (positive-line lst)
  (cond [(empty? lst) empty]
        [(and (number? (line-slope (first lst)))
              (or (> (line-slope (first lst)) 0) 
                  (> (line-intercept (first lst)) 0))) 
         (cons (make-line
                (line-slope (first lst))
                (line-intercept (first lst)))
               (positive-line (rest lst)))]
        [else (positive-line (rest lst))]))

;;Tests:
(check-expect (positive-line line-list1)
              (cons (make-line 1 0) empty))
(check-expect (positive-line (cons line1 (cons line2 empty)))
              (cons
               (make-line 1 0)
               (cons (make-line 0 3) empty)))

;; D)
;; (through-point lst pt) consumes a (listof Line (list))
;;  and a point (pt) to produce a list of lines which pass 
;;   through the point.

;; through-point: (listof Line) Posn -> (listof Line)

;; Examples:
(check-expect(through-point line-list1 (make-posn 2 2))
             (cons
              (make-line 1 0)
              (cons (make-line 'undefined -4) empty)))

(check-expect(through-point (cons line2 (cons line3 empty))(make-posn 1 0))
             empty)

(define (through-point lst pt)
  (cond [(empty? lst) empty]
        [(or (symbol? (line-slope (first lst)))
             (= (posn-x pt)(line-intercept (first lst))))
         (cons (first lst) (through-point (rest lst) pt))]
        [(= (posn-y pt) (+ (* (line-slope (first lst))(posn-x pt))
                           (line-intercept (first lst))))
         (cons (first lst) (through-point (rest lst) pt))]
        [else (through-point (rest lst) pt)]))


;; Tests:
(check-expect(through-point line-list (make-posn -4 3))
             (cons (make-line 0 3) 
                   (cons (make-line 'undefined -4) empty)))

(check-expect(through-point line-list2 (make-posn 4 2))
             (cons (make-line 'undefined -4) empty))

;;3e)

;; (parallel-non-intersect-lines lst) consumes a list of Line
;;  (lst) and prdouces a list of Boolean values. 
;; True indicating that a pair of lines are parallel.

;; parallel-non-intersect-lines: (listof List) -> (listof Bool)
;; Requires:
;; * (listof Line) contains at least 2 elements

;; Examples:
(check-expect (parallel-non-intersect-lines (cons line1 (cons line1(cons line2 empty))))
              (cons false (cons false empty)))
(check-expect (parallel-non-intersect-lines (cons line1 (cons line5(cons line3 empty))))
              (cons true (cons false empty)))


(define (parallel-non-intersect-lines lst)
  (cond [(empty? (rest lst)) empty]
        [(symbol?(line-slope (first lst)))
         (cond 
           [(symbol? (line-slope (first (rest lst))))
         (cons true (parallel-non-intersect-lines (rest lst)))]
           [else (cons false (parallel-non-intersect-lines (rest lst)))])]
        [(symbol?(line-slope (first (rest lst))))
         (cond 
           [(symbol? (line-slope (first lst)))
         (cons true (parallel-non-intersect-lines (rest lst)))]
           [else (cons false (parallel-non-intersect-lines (rest lst)))])]
        [(and (slope-equal? lst)
              (= (line-intercept (first lst)) (line-intercept (first (rest lst)))))
          (cons false (parallel-non-intersect-lines (rest lst)))]
        [(slope-equal? lst)
         (cons true (parallel-non-intersect-lines (rest lst)))]
        [else (cons false (parallel-non-intersect-lines (rest lst)))]))

;; Tests:
(check-expect (parallel-non-intersect-lines (cons line4 (cons line6 (cons line1 empty))))
              (cons true (cons false empty)))
(check-expect (parallel-non-intersect-lines line-list2)
              (cons false (cons false empty)))
(check-expect (parallel-non-intersect-lines line-list1)
              (cons false empty))

;; (slope-equal? lst) consumes a list of Line (lst) and
;;  determines if the pair of lines have the same slope.

;; slope-equal?: (listof Line) -> Bool

;;Examples:
(check-expect (slope-equal? (cons line1(cons line1 empty))) true)
(check-expect (slope-equal? (cons line1(cons line2 empty))) false)

(define (slope-equal? lst)
  (cond [(= (line-slope (first lst)) (line-slope (first (rest lst)))) true]
        [else false]))

;;Tests:
(check-expect (slope-equal? (cons line2(cons line2 empty))) true)