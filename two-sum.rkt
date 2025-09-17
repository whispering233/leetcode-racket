#lang racket

(define/contract (two-sum nums target)
  (-> (listof exact-integer?) exact-integer? (listof exact-integer?))
  (let ([ht (make-hash)])
    (for/first ([(num index) (in-indexed nums)])
      (let ([complement (- target num)])
        (if (hash-has-key? ht complement)
            (list (hash-ref ht complement) index)
            (begin
              (hash-set! ht num index)
              #f))))))