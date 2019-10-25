(defun C:DIM3D ()


	(setq 
		axis (getstring "\nSelect Axis (X or Y): (X)")
		point1 (getpoint "\nPoint 1")
		point2 (getpoint "\nPoint 2")
	)
	(setq oldsnap (getvar "osmode"))
	(setvar "osmode" 0)
	(setq length
		(distance 
			point1 
			(if
				(= axis "y")
				(list 
					(car point1)
					(cadr point2)
					(caddr point2)
				)
				(list
					(car point2)
					(cadr point1)
					(caddr point2)
				)
			)
		)
	)

	(command "dimlinear" point1 point2 pause)
	(setvar "osmode" oldsnap)

	(setq dim (entlast))

	(setq 
		feet 
			(atoi
				(rtos
					(/ length 12)
				)
			)
		inches
			(atoi
				(rtos
					(*
						(- length (* feet 12))
						12
					)
				)
			)
		newDimension
			(strcat (itoa feet)"'-"(itoa inches)"\"")
	)

	(command "dimedit" "n" newDimension dim "")
	
	(princ)
)