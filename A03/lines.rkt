;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lines) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; A)
(define-struct line (slope intercept))
;; A Line is a (make-line (anyof 'undefined Num) Num)

;; B)
;; (slope pt1 pt2) consumes 2 posns (pt1 and pt2)
;;  and determines the slope for the line they make.

;; slope: Posn Posn -> (anyof Num 'undefined)

;; Examples:
(check-expect (slope (make-posn 1 2)(make-posn 2 3)) 1)
(check-expect (slope (make-posn 2 2)(make-posn 2 2)) 'undefined)

(define (slope pt1 pt2)
  (cond [(or (zero? (-(posn-y pt1)(posn-y pt2)))
             (zero? (-(posn-x pt1)(posn-x pt2))))
         'undefined]
        [else (/ (-(posn-y pt1)(posn-y pt2))
     (-(posn-x pt1)(posn-x pt2)))]))

;;Tests:
(check-expect (slope (make-posn 1 0)(make-posn 2 1)) 1)
(check-expect (slope (make-posn 1 1)(make-posn 1 2)) 'undefined)

;; (two-points->line pt1 pt2) consumes two Posns
;;  (pt1 and pt2) and produces a Line containing
;;   the slope and intercept of the 2 posns.

;; two-points->line: Posn Posn -> Line

;;Example:
(check-expect (two-points->line (make-posn 2 2) (make-posn 1 4))
              (make-line -2 6))
(check-expect (two-points->line (make-posn 2 4) (make-posn 3 4))
             (make-line 'undefined 2))


(define (two-points->line pt1 pt2)
  (make-line (slope pt1 pt2)
             (cond [(symbol? (slope pt1 pt2))
                    (posn-x pt1)]
                   [else (- (posn-y pt1) (* (posn-x pt1 ) 
                                (slope pt1 pt2)))])))
          
;;Tests:
(check-expect (two-points->line (make-posn 0 0) (make-posn 1 1))
              (make-line 1 0))
(check-expect (two-points->line (make-posn 2 3) (make-posn 2 2))
             (make-line 'undefined 2))
(check-expect (two-points->line (make-posn 1 0) (make-posn 2 1))
              (make-line 1 -1))

;; C)

;; Helpers

;; (x-intercept line1 line2) determines the x-value 
;;  of the point of intersection between the two
;;   lines.

;; x-intercept: Line Line -> Num

;;Examples:
(check-expect(x-intercept (make-line 2 4) (make-line -2 4))
             0)
(check-expect(x-intercept (make-line 4 1) (make-line 2 2))
             -.5)

(define (x-intercept line1 line2)
  (/ (- (line-intercept line1) (line-intercept line2))
     (- (line-slope line1) (line-slope line2))))

;;Tests:
(check-expect(y-intercept (make-line 2 2) (make-line -2 1))
             2.5)
(check-expect(y-intercept (make-line 2 1) (make-line 1 2))
             -1)

;; (y-intercept line1 line2) determines the y-value 
;;  of the point of intersection between the two
;;   lines.

;; y-intercept: Line Line -> Num

;; Examples:
(check-expect(y-intercept (make-line 2 4) (make-line -2 4))
             4)
(check-expect(y-intercept (make-line 4 1) (make-line 2 2))
             -1)

(define (y-intercept line1 line2)
  (+ (* (line-slope line1) (x-intercept line1 line2))(line-intercept line1)))

;;Tests:
(check-expect(y-intercept (make-line 2 2) (make-line -2 4))
             1)
(check-expect(y-intercept (make-line 4 1) (make-line 2 2))
             -1)



;; (intersection line1 line2) consumes two Lines anc determines
;;  what their point of intersection is in (X,Y) Posn form.

;; intersection: Line Line -> Posn

;;Examples:
(check-expect (intersection (make-line 2 4) (make-line -2 4))
              (make-posn 0 4))
(check-expect (intersection (make-line 3 3) (make-line 1 1))
             (make-posn 1 6))

(define (intersection line1 line2)
  (cond [(equal? line1 line2) 'undefined]
    [else (make-posn (x-intercept line1 line2)
             (y-intercept line1 line2))]))

;;Tests:
(check-expect (intersection (make-line 1 0) (make-line -1 0))
              (make-posn 0 0))
(check-expect (intersection (make-line 1 1) (make-line 1 1))
              'undefined)
(check-expect (intersection (make-line 2 4) (make-line 4 6))
             (make-posn 1 6))