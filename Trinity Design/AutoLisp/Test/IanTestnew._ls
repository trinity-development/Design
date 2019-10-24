(defun c:iantest()
  (setq a 3.5)
  
  (if (= a 3.5)
    (progn
      (alert "not test var")
      (alert "not good")
      )
  (alert a)
  )
  )