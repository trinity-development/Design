(defun c:shadepoint( / *error*)

	(setq oldsnap (getvar "osmode"))
	
	(defun *error* (msg)
		(setvar "osmode" oldsnap)
	)

	(setvar "osmode" 0)

	
	(command "ctab" "layout1")
	
	(setq num 1)
	(while
		(setq pt (getpoint "\nChoose a point: "))
		(progn
			(command "-insert" "shadePoint" pt "" "" "" num)
			(setq num (1+ num))
		)
		
	)
	
	(setvar "osmode" oldsnap)

	(princ)
)
