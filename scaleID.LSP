;-----------------------------------------------------------------------------;
;-----------------------------------------------------------------------------;
;-------------CHANGES THE SCALING OF THE ROOF ID BLOCKS TO--------------------;
;-----------------A SPECIFIED SCALE-------------------------------------------;
;-----------------------------------------------------------------------------;
;-----------------------------------------------------------------------------;
;-----MADE BY TAMIR LIEBER----------------------------------------------------;
;-----------------------------------------------------------------------------;

(defun c:SCALEID (/ adoc RF)
	(if(setq x (ssget "x" (list (cons 8 "N - ROOF NUMBERS")))); make a selection set of the layer N - ROOF NUMBERS
		(progn
		  (setq scalenum (getstring "How much would you like to scale by?\n"))
		(setq i 0
		      y (sslength x)
		)
			(while (< i y)
       				(setq s (ssname x i))
       				(setq elist (entget s))
       				(setq pnt (cdr(assoc 10 elist)));get the base point
         			(command "scale" s "" pnt (atoi scalenum));scale roof IDs to specified scaling factor
				  (setq i (+ i 1))
     			  );end while
		);progn
	  
		(princ)
	);end if
  );defun
