;-----------------------------------------------------------------------------;
;-----------------------------------------------------------------------------;
;-------------CHANGES THE ANGLE OF THE ROOF ID BLOCKS TO 0--------------------;
;-----------------------------------------------------------------------------;
;-----------------------------------------------------------------------------;
;-----------------------------------------------------------------------------;
;-----MADE BY TAMIR LIEBER----------------------------------------------------;
;-----------------------------------------------------------------------------;

(defun c:ROTID (/ adoc RF)
	(if(setq x (ssget "x" (list (cons 8 "N - ROOF NUMBERS")))); make a selection set of the layer N - ROOF NUMBERS
		(progn
		(setq i 0
		      y (sslength x)
		)
			(while (< i y)
       				(setq s (ssname x i))
       				(setq elist (entget s))
       				(setq pnt (cdr(assoc 10 elist)));get the base point
         			(setq rad (cdr (assoc 50 (entget s))));get rotation angle in radians
         			(setq deg (/ (* rad 180) pi));switch to degrees
         			(command "rotate" s "" pnt (- 360 deg));make the rotation angle 0
				  (setq i (+ i 1))
     			  );end while
		);progn
		(princ)
	);end if
  );defun
