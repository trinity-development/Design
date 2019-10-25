(defun c:testbeam ()
 	 ;define the function

;*************************************

  ;Get User Inputs

  (setq lb (getdist "\nLength of Beam : "))
  ;get the length of the beam

  (setq hb (getdist "\nHeight of Beam : "))
  ;get the height of the beam

  (setq wt (getdist "\nFlange Thickness : "))
  ;get the thickness of the flange

  (setq ep (getdist "\nEnd Plate Thickness : "))
  ;get the thickness of the end plate

  (setq nl (getdist "\nLength of Notch : "))
  ;get the length of notch
  
  (setq nd (getdist "\nDepth of Notch : "))
  ;get the deph of the notch

  ; End of User Inputs

  ;************************************************

  	;Get Insertion Point

  (setq ip (getpoint "\nInsertion Point : "))
  ;get the insertion point


  ;***********************************************

  	(princ)
  	;finish cleanly

  )	;end of defun


;************************************************

(princ)  ;load cleanly

;************************************************