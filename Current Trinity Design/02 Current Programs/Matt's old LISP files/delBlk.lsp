(defun DELBLK (N / A E)

	
	(if 
		(tblsearch "block" N)
		(progn
        		(Setq A 0)
        		(Setq E (Entnext))
        		(While E
        			(If 
					(= 
						N 
						(cdr 
							(Assoc 
								2 
								(Entget E)
							)
						)
					)
					(progn
        	        			(Entdel E)
        	       				(Setq A (1+ A))
        	        		)
        	      		)
        		 	(Setq E (Entnext E))
			)	
		)
	)
    	(Princ)
)