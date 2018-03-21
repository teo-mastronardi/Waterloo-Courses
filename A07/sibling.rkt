;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname sibling) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))



(define (num-siblings t n)
  (cond [(empty? t) false]
        [(cons? (first t)) (how-many (first t) n 
                                     (first t) t)]
        [(= n (first t)) 0]
        [else (num-siblings (rest t) n)]))

(define (how-many lst n acc o-list)
  (cond [(empty? lst) (num-siblings (rest o-list) n)]
        [(= n (first lst)) (- (length acc) 1)]
        [else (how-many (rest lst) n (first o-list) o-list)]))


;; This function doesn't work. What was supposed to happen was 
;; if num-siblings found a number, it would call this function
;; and this function would add up all the single number terms
;; and then produce it. Can you annotate what i did wrong?
(define (how-many-num lst n o-list num)
  (cond [(empty? lst) num]
        [(cons? (first lst)) (num-siblings lst n)]
        [(= n (first lst)) (how-many-num (rest lst) n o-list (add1 num))]
        [else (how-many-num (rest lst) n o-list (add1 num))]))


(check-expect (num-siblings '((1 2 3) 8 9 (4 5 6)) 10) 0)



