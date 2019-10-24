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


  	;Start of Polar Calculations

  	(setq p2 (polar ip (dtr 180.0) (- (/ lb 2) nl)))
	(setq p3 (polar p2 (dtr 270.0) wt))
  	(setq p4 (polar p2 (dtr 270.0) nd))
  	(setq p5 (polar p4 (dtr 180.0) nl))
  	(setq p6 (polar p5 (dtr 180.0) ep))
  	(setq p7 (polar p6 (dtr 270.0) (-hb nd))
	(setq p8  (polar p7 (dtr 0.0) ep))
	(setq p9  (polar p8 (dtr 90.0) wt))
	(setq p10 (polar p9 (dtr 0.0) lb))
	(setq p11 (polar p8 (dtr 0.0) lb))
	(setq p12 (polar p11 (dtr 0.0) ep))
	(setq p13 (polar p12 (dtr 90.0) (- hb nd)))
	(setq p14 (polar p13 (dtr 180.0) ep))
	(setq p15 (polar p14 (dtr 180.0) nl))
	(setq p16 (polar p15 (dtr 90.0) (- nd wt)))
	(setq p17 (polar p16 (dtr 90.0) wt))
	;End of Polar Calculations

	      
;***********************************************


	;Start of Command Function

	(command "Line" ip p2 p4 p6 p7 p12 p13 p15 p17 "c"
		 "Line" p3 p16 " "
		 "Line" p9 p10 " "
		 "Line
	      
;***********************************************

  	(princ)
  	;finish cleanly

  )	;end of defun


;************************************************


;This function converts Degrees to Radians.

(defun dtr (x)
  	;define degrees to radians function

  	(*pi (/ x 180.0)
	;divide the angle by 180 then
	;multiply the result by the constant PI

)	;end of function	     


;************************************************
(princ)  ;load cleanly

;************************************************