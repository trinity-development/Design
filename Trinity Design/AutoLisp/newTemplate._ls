(defun c:newtemplate()
	(defun dtr ( deg ) (* pi (/ deg 180.0)))
	(setq 
		oldFile (getvar "filedia")
		oldSnap (getvar "osmode")
		oldCmd (getvar "cmddia")
		oldEcho (getvar "cmdecho")
		count 0
		templateList'(
			((6952.07 16623.1 0.0) "N1")
			((7879.74 16623.1 0.0) "N2")
			((8807.4  16623.1 0.0) "N3")
			((9735.07 16623.1 0.0) "N4")
			((10662.7 16623.1 0.0) "N5")
			((11590.4 16623.1 0.0) "M1")
			((12518.1 16623.1 0.0) "M2")
			((13445.7 16623.1 0.0) "M3")
			((14373.4 16623.1 0.0) "M4")
			((15301.1 16623.1 0.0) "M5")
			((6952.07 15141.5 0.0) "N1C")
			((7879.74 15141.5 0.0) "N2C")
			((8807.4 15141.5 0.0) "N2C1C")
			
			
			((7647.18 22196.2 0.0) "T1CAC")
			((8574.85 22196.2 0.0) "T1AC")
			((9502.51 22196.2 0.0) "T2AC")
			((10430.2 22196.2 0.0) "T3AC")
			
			((12330.5 22196.2 0.0) "T1DC")
			((13209.3 21455.4 0.0) "T1DCSS")
			
			((14741.1 22196.2 0.0) "T1CDC")
			
			((15619.8 21455.4 0.0) "T1CDCSS")

		)
	)
	(setvar "cmdecho" 0)
	(setvar "filedia" 0)
	(setvar "osmode" 0)
	(setvar "cmddia" 0)
	(while
		(< count (length templateList))
		(progn	
			(setq
				template (nth count templateList)
				path (strcat "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES(TEST)\\" (nth 1 template) ".dwg")
				basePoint (nth 0 template)
				;;;
				secondPoint (polar basePoint (dtr 216) 1018.25)
				;;;
			)
			(if
				(findfile path)
				(command "wblock" path  "Y" "" basePoint "c" basepoint secondPoint "" "N")
				(command "wblock" path "" basePoint "c" basepoint secondPoint "" "N")
				
			)
			(command "undo" "1")
			(setq
				count (+ 1 count)
			)
		)
	)
	(setvar "filedia" oldFile)
	(setvar "osmode" oldSnap)
	(setvar "cmddia" oldCmd)
	(setvar "cmdecho" oldEcho)
	(princ)
)


