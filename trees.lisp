(defun my-tree (size depth i j)
    (cond
        (   (= depth 0)
            (char "_" 0)
        )
        (   (and
                (>= (+ j 1) (* 3 (expt 2 (- size 2))))
                (= i (+ 17 (expt 2 (- size 1))))
            )
            (char "1" 0)
        )
        (   (and
                (>= (+ j 1) (expt 2 (- size 1)))
                (< (+ j 1) (* 3 (expt 2 (- size 2))))
                (= (+ 1 j (abs (- i (+ 17 (expt 2 (- size 1)))))) (* 3 (expt 2 (- size 2))))
            )
            (char "1" 0)
        )
        (   (and
                (< (+ j 1) (expt 2 (- size 1)))
                (< i (+ 17 (expt 2 (- size 1))))
            )
            (my-tree (- size 1) (- depth 1) i j)
        )
        (   (and
                (< (+ j 1) (expt 2 (- size 1)))
                (> i (+ 17 (expt 2 (- size 1))))
            )
            (my-tree (- size 1) (- depth 1) (- i (expt 2 (- size 1))) j)
        )
        (   t
            (char "_" 0)
        )
    )
)

(defun build (size depth)
    (loop for b from 0 to (- (expt 2 size) 2)
        do
            (loop for a from 0 to 99
                do (write-char (my-tree size depth a b))
            )
            (terpri)
    )
)

(build 6 (read))
