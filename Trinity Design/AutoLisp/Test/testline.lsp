(defun c:testline ()
  ;define the function

  (setq a (getpoint "\nEnter First Point : "))
  ;get the first point

  (setq b (getpoint "\nEnter Second Point : "))
  ;get the second point

  (command "Line" a b "")
  ;draw the line

  (princ)
  ;clean running

  )	;end defun
(princ)
; clean loading

