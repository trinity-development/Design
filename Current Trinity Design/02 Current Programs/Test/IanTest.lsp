(defun c:iantest()
  (setq testvar 5)
  
  (if (= testvar nil)
    (progn
      (alert "not test var")
      (alert "not good")
      )
  (alert testvar)
  )
  )