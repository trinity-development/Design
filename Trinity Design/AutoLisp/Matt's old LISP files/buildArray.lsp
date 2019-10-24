(defun c:buildarray ( / *error* )

	(defun *error* (msg)
		(princ "error: ")
		(princ msg)
		(if
			oldsnap
			(setvar "osmode" oldsnap)
		)
		(if
			oldecho
			(setvar "cmdecho" oldecho)
		)
		(princ)
	)
		
		
	(setq
		highPt(getpoint "\nSelect High Point: ")
		lowPt1(getpoint "\nSelect Left Low point: ")
		lowPt2(getpoint "\nSelect Right Low point: ")
	)
	
	(portArray 
		(getpoint "\nSelect (Portrait) Point: ")
		highPt
		lowPt1
		lowPt2
	)

	(landArray 
		(getpoint "\nSelect (Landscape) Point: ")
		highPt
		lowPt1
		lowPt2
	)	
	

		


	(princ)
)

(defun portArray(arrayOrigin highPt lowPt1 lowPt2)
	(setq 
		oldsnap (getvar "osmode")
		oldecho (getvar "cmdecho")
	)
	(setvar "osmode" 0)
	(setvar "cmdecho" 0)
	
	(setq 
		arrayPt1 highPt
		pArray(ssadd)
		aPt1
			(polar highPt 4.71238898 21.7289) 
		aPt2
			(polar aPt1 0 16.9999)
	)
		
	(repeat 5
		(command "-insert" "panel" arrayPt1 "1" "1" "0")
		(ssadd (entlast) pArray)
		(setq arrayPt1 
			(polar arrayPt1 0 3.4166333)
		)
	)
	(setq arrayPt1 
		(polar highPt 4.71238898  5.4374333)
	)
	(repeat 5
		(command "-insert" "panel" arrayPt1 "1" "1" "0")
		(ssadd (entlast) pArray)
		(setq arrayPt1 
			(polar arrayPt1 0 3.4166333)
		)
	)
	(setq arrayPt1 
		(polar highPt 4.71238898  10.874866)
	)
	(repeat 5
		(command "-insert" "panel" arrayPt1 "1" "1" "0")
		(ssadd (entlast) pArray)
		(setq arrayPt1 
			(polar arrayPt1 0 3.4166333)
		)
	)

	(setq arrayPt1 
		(polar highPt 4.71238898  16.312299)
	)
	(repeat 5
		(command "-insert" "panel" arrayPt1 "1" "1" "0")
		(ssadd (entlast) pArray)
		(setq arrayPt1 
			(polar arrayPt1 0 3.4166333)
		)
	)
	
	(command "align" pArray "" aPt1 lowPt1 aPt2 lowPt2 highPt highPt)
	(command "move" pArray "" lowPt1 arrayOrigin)


	(setvar "osmode" oldsnap)
	(setvar "cmdecho" oldecho)


	(princ)
)

(defun landArray(arrayOrigin highPt lowPoint1 lowPoint)
	(setq 
		oldsnap (getvar "osmode")
		oldecho (getvar "cmdecho")
	)
	(setvar "osmode" 0)
	(setvar "cmdecho" 0)
	
	(setq 
		arrayPt1 highPt
		lArray(ssadd)
		aPt1
			(polar highPt 4.71238898 10.0416) 
		aPt2
			(polar aPt1 0 21.9164)
	)
		
	(repeat 4
		(command "-insert" "panelLand" arrayPt1 "1" "1" "0")
		(ssadd (entlast) lArray)
		(setq arrayPt1 
			(polar arrayPt1 0 5.4999333)
		)
	)
	(setq arrayPt1 
		(polar highPt 4.71238898  3.3541333)
	)
	(repeat 4
		(command "-insert" "panelLand" arrayPt1 "1" "1" "0")
		(ssadd (entlast) lArray)
		(setq arrayPt1 
			(polar arrayPt1 0 5.4999333)
		)
	)
	(setq arrayPt1 
		(polar highPt 4.71238898  6.7082666)
	)
	(repeat 4
		(command "-insert" "panelLand" arrayPt1 "1" "1" "0")
		(ssadd (entlast) lArray)
		(setq arrayPt1 
			(polar arrayPt1 0 5.4999333)
		)
	)

	(command "align" lArray "" aPt1 lowPt1 aPt2 lowPt2 highPt highPt)
	(command "move" lArray "" lowPt1 arrayOrigin)

	(setvar "osmode" oldsnap)
	(setvar "cmdecho" oldecho)


	(princ)
)