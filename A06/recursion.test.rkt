;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname recursion.test) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (list-posn loloi pos)
  (cond [(empty? loloi) false]
        [(and (= 1 (posn-y pos))(= 1 (posn-x pos)))
         (first loloi)]
        [(= 1 (posn-x pos))
         (list-posn (first loloi)(make-posn (posn-x pos)(sub1 (posn-y pos))))]
        [else (list-posn (rest loloi) (make-posn (sub1 (posn-x pos)) (posn-y pos)))]))


(list-posn (list(list 1 2 3) (list 4 5) (list 6 7 8)) (make-posn 2 2))