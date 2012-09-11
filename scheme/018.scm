#lang scheme

(define triangle '(
  (                            75 )
  (                          95  64 )
  (                        17  47  82 )
  (                      18  35  87  10 )
  (                    20   4  82  47  65 )
  (                  19   1  23  75   3  34 )
  (                88   2  77  73   7  63  67 )
  (              99  65   4  28   6  16  70  92 )
  (            41  41  26  56  83  40  80  70  33 )
  (          41  48  72  33  47  32  37  16  94  29 )
  (        53  71  44  65  25  43  91  52  97  51  14 )
  (      70  11  33  28  77  73  17  78  39  68  17  57 )
  (    91  71  52  38  17  14  91  43  58  50  27  29  48 )
  (  63  66   4  68  89  53  67  30  73  16  69  87  40  31 )
  ( 4  62  98  27  23   9  70  98  73  93  38  53  60   4  23 )
))

(define-struct node (row col total))

; Util functions
(define nth
  (lambda (n list)
    (cond
      ((= n 0) (car list))
      (else (nth (- n 1) (cdr list))))))

(define cons-two
  (lambda (from to)
    (cond
      ((null? from) to)
      (else
       (cons
        (car from)
        (cons
         (car (cdr from))
         to))))))

(define explore-node
  (lambda (triangle node)
    (cond
      ((= (- (length triangle) 1) (node-row node))
       '())
      (else
       (cons
        (make-node (+ (node-row node) 1)
                  (node-col node)
                  (+ (node-total node)
                     (nth (node-col node) (nth (+ (node-row node) 1) triangle))))
        (cons
         (make-node (+ (node-row node) 1)
                   (+ (node-col node) 1)
                   (+ (node-total node)
                      (nth (+ (node-col node) 1) (nth (+ (node-row node) 1) triangle))))
         '()))))))

(define graph-traversal
  (lambda (triangle open largest)
    (cond
      ((null? open) largest)
      (else 
       (graph-traversal 
        triangle
        (cons-two (explore-node triangle (car open)) (cdr open))
        (cond
          ((and (= (- (length triangle) 1) (node-row (car open)))
                (> (node-total (car open)) (node-total largest)))
           (car open))
          (else largest)))))))
        
(define result (graph-traversal triangle (cons (make-node 0 0 (car (car triangle))) '()) (make-node 0 0 0)))

(node-total result)