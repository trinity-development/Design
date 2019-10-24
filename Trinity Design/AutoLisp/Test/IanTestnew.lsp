(defun c:iantestnew()
  (setq a 3.5
	b 36)
  
  (if (= a 3.5)
    (progn
      (alert "not test var")
      (alert "not good")
      (alert (strcat (itoa b) " is a number"))
      )
  (alert a)
  )
  )