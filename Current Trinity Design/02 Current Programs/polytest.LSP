(defun c:pls(/ plSet ptLst plSet)
  (princ"\n<<< Select polyline >>> ")
  (and
   (setq plSet
	  (ssget "_:S" '((0 . "LWPOLYLINE"))))
   (setq ptLst
       (mapcar
	 '(lambda(x)(trans x 0 1))
	(mapcar 'cdr
	  (vl-remove-if-not
	    '(lambda(x)(= 10(car x)))
	      (entget
	        (ssname plSet 0))))))
   (sssetfirst nil
     (setq plSet(ssget "_WP" ptLst)))
   (if plSet
   (princ
     (strcat "\n"(itoa(sslength plSet))
	     " found :) ")
     ); end princ
     (princ "\nNothing found :( ")
    );end if
   ); end and
  (princ)
  ); end of c:plset