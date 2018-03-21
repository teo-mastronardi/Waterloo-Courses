;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname cond-b) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (q1b x)
   (cond [(and (p1? x) (< x 2015)) 'brown]
         [(p1? x) (p2? x)]
         [(p1? x) 'black]
         [else 'purple]))
