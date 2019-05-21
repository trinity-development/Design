;----------------------------------------------------------------------------------------------------------------------------;
;----------------------------------------------------------------------------------------------------------------------------;
;------------------------------COMPARES THE REVISION SNAPSHOT ROOF DATA TO THE CURRENT ROOF DATA-----------------------------;
;----------------------------------------------------------------------------------------------------------------------------;
;----------------------------------------------------------------------------------------------------------------------------;
;-----------MADE BY TAMIR----------------------------------------------------------------------------------------------------;
;----------------------------------------------------------------------------------------------------------------------------;


(defun c:snapcount()
  (setq arrlist '("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14" "15" "16" "17" "18" "19" "20"
		  "21" "22" "23" "24" "25" "25" "26" "27" "28" "29" "30" "31" "32" "33" "34" "35" "36" "37" "38" "39" "40")
	roofArray '()
  )
  (setq drawing (vla-get-summaryinfo (vla-get-activedocument (vlax-get-acad-object))));MUST HAVE FOR PERFOMING DWGPROPS MANIPULATION
  (foreach n arrlist
   ; (alert n)
    (setq keycount1 0)
    (setq revtypebinary 0)
  	(while;do until
	   (and;both
	    (< keycount1 (vla-numcustominfo drawing));go through the whole DWGPROPS until the last key
	    (= revtypebinary 0);the pitch binary variable is not equal to 0
	   )
	
	  (vla-getcustombyindex;get current numbered index from DWGPROPS
	      drawing
	      keycount1
	      'tempkeyname1
	      'tempkeyvalue1
	    )
	  	
	  	(if (= tempkeyname1 (strcat "Roof" n))
		  
		  (progn
		    	
		  	(setq roofArray(cons (strcat "Roof" n) roofArray))
		    	(setq keycount1 0)
		    	(setq revtypebinary 1)
		  )
		  (setq keycount1 (+ keycount1 1))
		)
	  )
    	
    )

;------------------------------------------------------------------------------------------------------;
;-----------------------------BEGIN MODULE COMPARISON--------------------------------------------------;
;------------------------------------------------------------------------------------------------------;
    (foreach k roofArray
      (setq revbinary 0)
      (setq keycount2 0)
      (while
	(and
	  (< keycount2 (vla-numcustominfo drawing))
	  (= revbinary 0)
	)
	(vla-getcustombyindex;get current numbered index from DWGPROPS
	      drawing
	      keycount2
	      'tempkeyname2
	      'tempkeyvalue2
	    )
		;(alert "hello")
		(if (= (+ keycount2 1) (vla-numcustominfo drawing));if this is the last key
	    	(if (= "MRS" (substr tempkeyname2 (- (strlen tempkeyname2) 2)));if the current key is a Salesforce orientation
	    		(if (= tempkeyname2 (strcat k "MRS"));if the current DWGPROPS key is equal to the current orientation variable
	      			(progn;execute
	      				(vla-getcustombykey drawing tempkeyname2 'modrevsnap);delete current DWGPROPS key
  					(vla-getcustombykey drawing (strcat k "S") 'modsales)
			  		(if (= modrevsnap modsales)
					  (princ (strcat"((No module changes on " k "))"))
					  (if (> modrevsnap modsales)
					    (progn
					    	(setq diff(abs(-(atoi modrevsnap) (atoi modsales))))
					    	(alert (strcat "(( "(itoa diff) "more modules on " k "))"))
					      
					    )
					    (progn
					      (setq diff(abs(-(atoi modrevsnap) (atoi modsales))))
					      (alert (strcat "(( "(itoa diff) "less modules on " k "))"))
					      
					    )
					   )
					  )
				  (setq revbinary 1)
	      			)
	      			(progn;if the current DWGPROPS key is not equal to the current orientation variable
	        			(setq revbinary 1)
	      			)
	     		);end if
		  	(setq revbinary 1)
	      	);end if
		;if this is not the last key
		(if (= "MRS" (substr tempkeyname2 (- (strlen tempkeyname2) 2)));if the current key is a Salesforce orientation
	    		(if (= tempkeyname2 (strcat k "MRS"));if the current DWGPROPS key is equal to the current orientation variable
	      			(progn;execute
	      				(vla-getcustombykey drawing tempkeyname2 'modrevsnap);delete current DWGPROPS key
  					(vla-getcustombykey drawing (strcat k "S") 'modsales)
			  		(if (= modrevsnap modsales)
					  (princ (strcat"((No module changes on " k "))"))
					  (if (> modrevsnap modsales)
					    (progn
					    	(setq diff(abs(-(atoi modrevsnap) (atoi modsales))))
					    	(alert (strcat "(( "(itoa diff) "more modules on " k "))"))
					        (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,_ADD_PANELS"))))
							(repeat (setq i (sslength s))
							(if  (= "_ADD_PANELS"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
								(LM:SetVisibilityState g "CHECKED")
							)
							)
      						)
					    )
					    (progn
					      (setq diff(abs(-(atoi modrevsnap) (atoi modsales))))
					      (alert (strcat "(( "(itoa diff) "less modules on " k "))"))
					      
					    )
					   )
					  )
					
				  (setq revbinary 1)
	      			)
	      			
	     		);end if
	      	);end if
	       )
		(setq keycount2 (+ keycount2 1))
	);end while
      );end foreach
  
;------------------------------------------------------------------------------------------------------;
;-----------------------------END MODULE COMPARISON----------------------------------------------------;
;------------------------------------------------------------------------------------------------------;

;------------------------------------------------------------------------------------------------------;
;-----------------------------BEGIN PITCH COMPARISON---------------------------------------------------;
;------------------------------------------------------------------------------------------------------;
  (foreach k roofArray
      (setq revbinary 0)
      (setq keycount2 0)
      (while
	(and
	  (< keycount2 (vla-numcustominfo drawing))
	  (= revbinary 0)
	)
	(vla-getcustombyindex;get current numbered index from DWGPROPS
	      drawing
	      keycount2
	      'tempkeyname2
	      'tempkeyvalue2
	    )
		(if (= (+ keycount2 1) (vla-numcustominfo drawing));if this is the last key
	    	(if (= "PRS" (substr tempkeyname2 (- (strlen tempkeyname2) 2)));if the current key is a Salesforce orientation
	    		(if (= tempkeyname2 (strcat k "PRS"));if the current DWGPROPS key is equal to the current orientation variable
	      			(progn;execute
	      				(vla-getcustombykey drawing tempkeyname2 'modrevsnap);delete current DWGPROPS key
  					(vla-getcustombykey drawing (strcat k "PS") 'modsales)
			  		(if (= modrevsnap modsales)
					  (princ (strcat"((No pitch changes on " k "))"))
					  (progn
					    (setq diff(abs(-(atoi modrevsnap) (atoi modsales))))
					    (alert (strcat "((Difference of " (itoa diff) " pitch degrees on " k "))"))
					  )
					)
				  (setq revbinary 1)
	      			)
	      			(progn;if the current DWGPROPS key is not equal to the current orientation variable
	        			(setq revbinary 1)
	      			)
	     		);end if
		  	(setq revbinary 1)
	      	);end if
		;if this is not the last key
		(if (= "PRS" (substr tempkeyname2 (- (strlen tempkeyname2) 2)));if the current key is a Salesforce orientation
	    		(if (= tempkeyname2 (strcat k "PRS"));if the current DWGPROPS key is equal to the current orientation variable
	      			(progn;execute
	      				(vla-getcustombykey drawing tempkeyname2 'modrevsnap);delete current DWGPROPS key
  					(vla-getcustombykey drawing (strcat k "PS") 'modsales)
			  		(if (= modrevsnap modsales)
					  (princ (strcat"((No pitch changes on " k "))"))
					  (progn
					    (setq diff (abs(-(atoi modrevsnap) (atoi modsales))))
					    (alert (strcat "((Difference of " (itoa diff) " pitch degrees on " k "))"))
					  )
					)
				  (setq revbinary 1)
	      			)
	      			
	     		);end if
	      	);end if
	       )
		(setq keycount2 (+ keycount2 1))
	);end while
      );end foreach
;------------------------------------------------------------------------------------------------------;
;-----------------------------END PITCH COMPARISON-----------------------------------------------------;
;------------------------------------------------------------------------------------------------------;

;------------------------------------------------------------------------------------------------------;
;-----------------------------BEGIN ORIENTATION COMPARISON---------------------------------------------;
;------------------------------------------------------------------------------------------------------;
  (foreach k roofArray
      (setq revbinary 0)
      (setq keycount2 0)
      (while
	(and
	  (< keycount2 (vla-numcustominfo drawing))
	  (= revbinary 0)
	)
	(vla-getcustombyindex;get current numbered index from DWGPROPS
	      drawing
	      keycount2
	      'tempkeyname2
	      'tempkeyvalue2
	    )
		(if (= (+ keycount2 1) (vla-numcustominfo drawing));if this is the last key
	    	(if (= "ORS" (substr tempkeyname2 (- (strlen tempkeyname2) 2)));if the current key is a Salesforce orientation
	    		(if (= tempkeyname2 (strcat k "ORS"));if the current DWGPROPS key is equal to the current orientation variable
	      			(progn;execute
	      				(vla-getcustombykey drawing tempkeyname2 'modrevsnap);delete current DWGPROPS key
  					(vla-getcustombykey drawing (strcat k "OS") 'modsales)
			  		(if (= modrevsnap modsales)
					  (princ (strcat"((No orientation changes on " k "))"))
					  (progn
					    (setq diff(abs(-(atoi modrevsnap) (atoi modsales))))
					    (alert (strcat "((Difference of " (itoa diff) " orientation degrees on " k "))"))
					  )
					)
				  (setq revbinary 1)
	      			)
	      			(progn;if the current DWGPROPS key is not equal to the current orientation variable
	        			(setq revbinary 1)
	      			)
	     		);end if
		  	(setq revbinary 1)
	      	);end if
		;if this is not the last key
		(if (= "ORS" (substr tempkeyname2 (- (strlen tempkeyname2) 2)));if the current key is a Salesforce orientation
	    		(if (= tempkeyname2 (strcat k "ORS"));if the current DWGPROPS key is equal to the current orientation variable
	      			(progn;execute
	      				(vla-getcustombykey drawing tempkeyname2 'modrevsnap);delete current DWGPROPS key
  					(vla-getcustombykey drawing (strcat k "OS") 'modsales)
			  		(if (= modrevsnap modsales)
					  (princ (strcat"((No orientation changes on " k "))"))
					  (progn
					    (setq diff(abs(-(atoi modrevsnap) (atoi modsales))))
					    (alert (strcat "((Difference of " (itoa diff) " orientation degrees on " k "))"))
					  )
					)
				  (setq revbinary 1)
	      			)
	      			
	     		);end if
	      	);end if
	       )
		(setq keycount2 (+ keycount2 1))
	);end while
      );end foreach
;------------------------------------------------------------------------------------------------------;
;-----------------------------END ORIENTATIOM COMPARISON-----------------------------------------------;
;------------------------------------------------------------------------------------------------------;
  )