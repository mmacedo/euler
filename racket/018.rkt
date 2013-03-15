#!/usr/bin/env racket
#lang racket

; http://projecteuler.net/problem=18

(define triangle '[
  [                            75 ]
  [                          95  64 ]
  [                        17  47  82 ]
  [                      18  35  87  10 ]
  [                    20   4  82  47  65 ]
  [                  19   1  23  75   3  34 ]
  [                88   2  77  73   7  63  67 ]
  [              99  65   4  28   6  16  70  92 ]
  [            41  41  26  56  83  40  80  70  33 ]
  [          41  48  72  33  47  32  37  16  94  29 ]
  [        53  71  44  65  25  43  91  52  97  51  14 ]
  [      70  11  33  28  77  73  17  78  39  68  17  57 ]
  [    91  71  52  38  17  14  91  43  58  50  27  29  48 ]
  [  63  66   4  68  89  53  67  30  73  16  69  87  40  31 ]
  [ 4  62  98  27  23   9  70  98  73  93  38  53  60   4  23 ]
])

(define-struct node [row col total])

; Brute force
(define [graph-traversal triangle callback]
  (define [cons-two to from]
    (if (null? from)
        to
        (cons (car from)
              (cons (cadr from)
                    to))))

  (define [explore-node node]
    (if (= (node-row node) (- (length triangle) 1))
        '()
        (let ([row (list-ref triangle (add1 (node-row node)))])
          (list (make-node (add1 (node-row node))
                           (node-col node)
                           (+ (node-total node) (list-ref row (node-col node))))
                (make-node (add1 (node-row node))
                           (add1 (node-col node))
                           (+ (node-total node) (list-ref row (add1 (node-col node)))))))))

  (define [iter open current previous-result]
    (let ([result (apply callback (list previous-result current))])
      (if (null? open)
          result
          (let ([next (car open)] [rest (cdr open)])
            (iter (cons-two rest (explore-node next)) next result)))))

  (let ([start (make-node 0 0 (list-ref (list-ref triangle 0) 0))])
    (iter (explore-node start) start '())))

(begin
  (define [find-largest previous current]
    (if (and (node? previous) (>= (node-total previous) (node-total current)))
        previous
        current))

  (define result (graph-traversal triangle find-largest))

  (display (node-total result))
  (newline))
