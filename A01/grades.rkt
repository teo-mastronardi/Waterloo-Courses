;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname grades) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;; Teo Mastronardi (20558296)
;; CS 135 Winter 2014
;; Assignment 01, Problem 3 (grades)
;; ///////////////////////////////////////////////////

;; 3 A)
(define (midterm x)
  (* x (/ 25 75)))
(define (final x)
  (* x (/ 50 75)))

(define (cs135-exam-grade x y)
   (+ (midterm x) (final y)))

;; 3 B)
(define (participation x)
  (* x (/ 5 100)))
(define (assignment y)
  (* y (/ 20 100)))
(define (exam z)
  (* z (/ 75 100)))
(define (cs135-final-grade x y z)
  (+ (participation x)
      (assignment y)
         (exam z)))

;; 3 C)
(define (final-cs135-exam-grade-needed x)
(/ (- (* 25/75 x) 50) -50/75))
