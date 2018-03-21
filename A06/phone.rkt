;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname phone) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; A)
;; (phone-letters) An association-list that
;; maps characteres to digits.

(define phone-letters
         (list (list #\a 2)(list #\b 2)(list #\c 2)
               (list #\d 3)(list #\e 3)(list #\f 3)
               (list #\g 4)(list #\h 4)(list #\i 4)
               (list #\j 5)(list #\k 5)(list #\l 5)
               (list #\m 6)(list #\n 6)(list #\o 6)
               (list #\p 7)(list #\q 7)(list #\r 7)
               (list #\s 7)(list #\t 8)(list #\u 8)
               (list #\v 8)(list #\w 9)(list #\x 9)
               (list #\y 9)(list #\z 9)))

;; B)
;; (mnemonic->num str al) consumes a string (str)
;;  and an association list (al). The function 
;;  produces a natural number by substituting each
;;   chaaracter in the string with the appropriate digit
;;    from the al.

;; mnemonic->num: Str (listof (listof Sym num)) -> Num

;; Examples:
(check-expect(mnemonic->num "aei" '((#\a 2)(#\e 3)(#\i 4))) 234)

(define(mnemonic->num str al)
  234)




(define(mnemonic->numm str al)
  (cond [(char=? (first (string->list str)) (first (first al)))
         (count (rest(string->list str)) (rest al)(second(first al)))]
        [else (mnemonic->num(rest(string->list str)) (rest al))]))


(define (count str al num)
  (cond [(empty? str) num]
        [(char=? (first str) (first(first al)))
         (count (rest str)(rest al) (append num (second(first al))))]
        [else (count (rest str)(rest al) num)]))
         
         
    
        
    
    
  