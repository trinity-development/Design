(defun c:ryansmom()
  (setq a 7.5
	b "poop"
	c "bone")

  (if
    (and
	(= a 7.5)
	(/= T (numberp b))
	(/= c "")
	)
    (alert "winner winner")
    (alert "loser loser")
    )
  )