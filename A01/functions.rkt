;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname functions) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;; Teo Mastronardi (20558296)
;; CS 135 Winter 2014
;; Assignment 01, Problem 1 (Functions)
;; ///////////////////////////////////////////////////

;;1 A)
(define (sphere-volume r)
  (/ (* 4 pi (expt r 3)) 3))

;; 1 B)
(define (HM x y z)
  (/ 3(+ (/ 1 x)(/ 1 y)(/ 1 z))))

;; 1 C)
(define g 9.8)
(define (height v t)
  (- (* v t)(/ (* g (sqr t)) 2)))