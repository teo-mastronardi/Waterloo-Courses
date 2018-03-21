;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname cards) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;; Teo Mastronardi (20558296)
;; CS 135 Winter 2014
;; Assignment 03, Problem 4 (cards)
;; ///////////////////////////////////////////////////


; 4A)****************************************************
(define-struct card(rank suit))
;; A Card is a (make-card Nat Sym)
(define-struct hand(c1 c2 c3))
;; A Hand is a (make-hand Card Card Card)

; 4B)****************************************************
;; Constants:
(define three-clubs (make-card 3 'clubs))
(define two-spades (make-card 2 'spades))
(define three-spades (make-card 3 'spades))
(define one-hearts (make-card 1 'hearts))
(define two-diamonds (make-card 2 'diamonds))
(define one-clubs (make-card 1 'clubs))
(define ten-clubs (make-card 10 'clubs))
(define two-clubs (make-card 2 'clubs))
(define one-spade (make-card 1 'spades))

(define straight-hand (make-hand three-clubs two-spades one-hearts))
(define straight-flush-hand (make-hand three-clubs two-clubs one-clubs))
(define flush-hand (make-hand ten-clubs two-clubs one-clubs))
(define 3-kind (make-hand one-hearts one-clubs one-spade))
(define 2-kind (make-hand one-clubs one-spade three-clubs))
(define high-card (make-hand one-spade three-clubs two-diamonds))


;; (better-card card1 card2) consumes two cards and determines
;;  which card has the higher value and prouduces that card.

;; better-card: Card Card -> Card

;;Examples:
(check-expect(better-card two-spades two-diamonds) two-spades)
(check-expect(better-card ten-clubs one-spade) one-spade)

(define (better-card card1 card2)
  (cond [(symbol=? (card-suit card1) (card-suit card2))
         (cond [(> (card-rank card1)(card-rank card2))
                card1]
               [else card2])]
        [(symbol=? 'spades (card-suit card1)) card1]
        [(symbol=? 'spades (card-suit card2)) card2]
        [(symbol=? 'clubs (card-suit card1)) card2]
        [(symbol=? 'clubs (card-suit card2)) card1]
        [(symbol=? 'diamonds (card-suit card1)) card2]
        [(symbol=? 'diamonds (card-suit card2)) card1]))

;;Tests
(check-expect(better-card three-clubs two-spades) two-spades)
(check-expect(better-card ten-clubs one-hearts) one-hearts)
(check-expect(better-card two-spades one-spade) two-spades)
(check-expect(better-card one-hearts three-clubs) one-hearts)
(check-expect(better-card three-clubs ten-clubs) ten-clubs)
(check-expect(better-card two-diamonds one-hearts) one-hearts)
(check-expect(better-card one-hearts two-diamonds) one-hearts)
(check-expect(better-card one-hearts two-diamonds) one-hearts)

;; C) *******************************************************

;; (hand-value deck) consumes a (Hand deck) and determines
;;  the best hand-value by producing a symbol.

;; hand-value: Hand -> Sym

;;Examples:
(check-expect (hand-value straight-hand) 'straight)
(check-expect (hand-value flush-hand) 'flush)



(define (hand-value deck)
  (cond [(and (symbol=? (card-suit (hand-c1 deck))(card-suit (hand-c2 deck)))
              (symbol=? (card-suit (hand-c1 deck))(card-suit (hand-c3 deck)))
             (or (and (= (sub1 (card-rank (hand-c1 deck)))(card-rank (hand-c2 deck)))
              (= (sub1 (card-rank (hand-c2 deck)))(card-rank (hand-c3 deck))))
             (and (= (add1 (card-rank (hand-c1 deck)))(card-rank (hand-c2 deck)))
                  (= (add1 (card-rank (hand-c2 deck)))(card-rank (hand-c3 deck))))))
         'straight-flush]
        [(and (symbol=? (card-suit (hand-c1 deck))(card-suit (hand-c2 deck)))
              (symbol=? (card-suit (hand-c1 deck))(card-suit (hand-c3 deck))))
         'flush]
        [(or (and (= (sub1 (card-rank (hand-c1 deck)))(card-rank (hand-c2 deck)))
              (= (sub1 (card-rank (hand-c2 deck)))(card-rank (hand-c3 deck))))
             (and (= (add1 (card-rank (hand-c1 deck)))(card-rank (hand-c2 deck)))
              (= (add1 (card-rank (hand-c2 deck)))(card-rank (hand-c3 deck)))))
         'straight]
        [(= (card-rank (hand-c1 deck))(card-rank (hand-c2 deck))
            (card-rank (hand-c3 deck))) 'three-of-a-kind]
        [(or (= (card-rank (hand-c1 deck))(card-rank (hand-c2 deck)))
              (= (card-rank (hand-c2 deck))(card-rank (hand-c3 deck)))
               (= (card-rank (hand-c1 deck))(card-rank (hand-c3 deck)))) 'pair]
        [else 'high-card]))

;;Tests:
(check-expect (hand-value straight-flush-hand) 'straight-flush)
(check-expect (hand-value 3-kind) 'three-of-a-kind)
(check-expect (hand-value 2-kind) 'pair)
(check-expect (hand-value high-card) 'high-card)


             
        
        
        
        
              
  