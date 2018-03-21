;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname student) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;; Teo Mastronardi (20558296)
;; CS 135 Winter 2014
;; Assignment 06, Problem 2 (student)
;; ///////////////////////////////////////////////////


;; A)
;; (tallest los lon) consumes a list of
;;  symbols (los) and a list of numbers 
;;   (lon) to produce the name of the student
;;    who is the tallest.

;; tallest: (listof Sym) (listof Num) -> Sym
;; requires: 
;; * (lon are positive numbers)
;; * both los and lon are non empty
;;   and same length

;; Examples:
(check-expect (tallest '(Bernie Raj Amy)
                        '(1.5 1.7 1.8)) 'Amy)
(check-expect (tallest '(Phil Amy)
                        '(1.5 1.8)) 'Amy)

(define (tallest los lon)
  (cond [(empty? (rest lon)) (first los)]
        [(>= (first lon)(first(rest lon))) (first los)]
        [else (tallest (rest los) (rest lon))]))

;; Tests:
(check-expect (tallest '(Bernie Raj Amy)
                        '(1.9 1.7 1.8)) 'Bernie)
(check-expect (tallest '(Phil Amy Tommy)
                        '(1.5 2.2 2.1)) 'Amy)
(check-expect (tallest '(Phil Amy Tommy)
                        '(1.5 1.5 1.5)) 'Phil)


;; B)
;;(shortest los lon) consumes a list of
;;  symbols (los) and a list of numbers 
;;   (lon) to produce the name of the student
;;    who is the shortest.

;; shortest (listof Sym) (listof Num) -> Sym
;; requires: 
;; * (lon are positive numbers)
;; * both los and lon are non empty
;;   and same length

;; Examples:
(check-expect(shortest '(Raj Amy)'(1.5 1.6)) 'Raj)
(check-expect(shortest '(Raj Amy Phil)'(1.8 1.6 1.7)) 'Amy)

(define (shortest los lon)
  (cond [(empty? (rest los)) (first los)]
        [(<= (first lon)(first(rest lon)))
         (current-max (rest los) (rest lon)
                         (first los) 
                         (first lon))]
        [else (shortest (rest los)(rest lon))]))

;; Tests:
(check-expect(shortest '(Bernie Raj Amy Phil)'(1.1 1.5 1.2 1.3)) 'Bernie)
(check-expect(shortest '(Bernie Raj Amy Phil)'(1.5 1.2 1.1 1.3)) 'Amy)
(check-expect(shortest '(Raj Amy Phil)'(1.5 1.6 1.3)) 'Phil)
(check-expect(shortest '(Raj Amy Phil)'(1.5 1.5 1.5)) 'Raj)
(check-expect(shortest '(Raj)'(1.5)) 'Raj)



;; (current-max los lon accs accn) consumes
;;  a list of names (los) a list of numbers (lon)
;;   a Symbol (accs) and a Number (accn) and determines
;;    the smallest number to its corresponding symbol.

;; current-max: (listof Sym)(listof Num) Sym Num -> Sym
;; requires: 
;; * los lon are same length

;; Examples:
(check-expect(current-max '(Bernie Amy Phil)'(1.1 1.2 1.3) 'Bernie 1.1) 'Bernie)
(check-expect(current-max '(Bob Phil)'(1.7 1.3) 'Bernie 1.4) 'Phil)

(define (current-max los lon accs accn)
  (cond [(empty? lon) accs]
        [(<= accn (first lon))(current-max (rest los)(rest lon)
                                            accs accn)]
        [else (current-max (rest los) (rest lon) (first los)
                      (first lon))]))
;; Tests:
(check-expect(current-max '(Bernie Amy Phil)'(1.1 1.2 1.3) 'Bernie 1.1) 'Bernie)
(check-expect(current-max '(Amy Phil)'(1.2 1.3) 'Bernie 1.1) 'Bernie)

;; C)
;; (student-al los lon) consumes a list of 
;;  symbols which are names of the students (los)
;;   and a list of numbers which are the height of the
;;    students (lon).
;; Student-al should then produce an association list

;; student-al: (listof Sym) (listof Num) -> (listof Num Str)
;; requires:
;; * los lon be the same length
;; * lon be positive numbers

;; Examples:
(check-expect (student-al '(Bernie Raj) '(1.6 1.8))
              '((Bernie 1.6) (Raj 1.8)))
(check-expect (student-al '(Bernie Raj Amy) '(1.6 1.7 1.8))
              '((Bernie 1.6) (Raj 1.7)(Amy 1.8)))

(define (student-al los lon)
  (cond [(empty? los) empty]
        [else (cons (make-lst (first los)(first lon))(student-al (rest los)(rest lon)))]))

;; Tests:
(check-expect (student-al '(Bernie Raj Amy Phil) '(1.5 1.7 1.6 1.8))
              '((Bernie 1.5) (Raj 1.7) (Amy 1.6) (Phil 1.8)))
(check-expect (student-al '(Bernie Raj Amy Phil Kim) '(1.5 1.7 1.6 1.8 2))
              '((Bernie 1.5) (Raj 1.7) (Amy 1.6) (Phil 1.8)(Kim 2)))
(check-expect (student-al '() '())
              '())

;; (make-lst sym num) consumes a symbol and number
;;  to produce a list

;; make-lst: Sym Num -> (listof Sym Num)

;; Examples: 
(check-expect(make-lst 'Phil 1.6) '(Phil 1.6))
(check-expect(make-lst 'Amy 1.2) '(Amy 1.2))

(define (make-lst sym num)
  (list sym num))

;; Tests:
(check-expect(make-lst 'Bernice 1.3) '(Bernice 1.3))
(check-expect(make-lst 'Phil 1.5) '(Phil 1.5))



;; D)
;; (basketball al ht) consumes an AL (al) 
;;  containing names and height, and a height (ht)
;;   and producesa list of names of who is greater or
;;    equal to ht.

;; basketball: (list (list Str Num)) Num -> (listof Sym)

;; Examples:
(check-expect (basketball '((Tommy 1.5) (Raj 1.7)) 1.6)
              '(Raj))
(check-expect (basketball '((Bernie 1.5) (Raj 1.7) (Amy 1.6)) 1.2)
              '(Bernie Raj Amy))

(define (basketball al ht)
  (cond [(empty? al) empty]
        [(>= (second(first al)) ht) (cons (first(first al))
                                        (basketball (rest al) ht))]
        [else (basketball (rest al) ht)]))

;; Tests:
(check-expect (basketball '((Bernie 1.5) (Raj 1.7) (Amy 1.6)) 1.8)
              '())
(check-expect (basketball '((Bernie 1.5) (Raj 1.7) (Amy 1.6) (Kim 1.3)) 1.4)
              '(Bernie Raj Amy))
(check-expect (basketball '((Bernie 1.5) (Raj 1.7) (Amy 1.6) (Kim 1.3)) 1.3)
              '(Bernie Raj Amy Kim))
(check-expect (basketball '() 1.6)
              '())