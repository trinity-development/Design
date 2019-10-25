;----------------------------------------------------------------------------------------------------------------------------;
;----------------------------------------------------------------------------------------------------------------------------;
;------------------------------COMPARES THE REVISION SNAPSHOT ROOF DATA TO THE CURRENT ROOF DATA-----------------------------;
;----------------------------------------------------------------------------------------------------------------------------;
;----------------------------------------------------------------------------------------------------------------------------;
;-----------MADE BY TAMIR----------------------------------------------------------------------------------------------------;
;----------------------------------------------------------------------------------------------------------------------------;


(defun c:snapcount()
  (setq arrlist (vlax-make-safearray vlax-vbstring '(0 . 40))
	roofArray '()
	buildingtxt1 " "
  )
  (setq drawing (vla-get-summaryinfo (vla-get-activedocument (vlax-get-acad-object))));MUST HAVE FOR PERFOMING DWGPROPS MANIPULATION
  (vlax-safearray-fill arrlist '("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14" "15" "16" "17" "18" "19" "20"
		  "21" "22" "23" "24" "25" "25" "26" "27" "28" "29" "30" "31" "32" "33" "34" "35" "36" "37" "38" "39" "40"))
;------------------------------------------------------------------------------------------------------;
;-----------------------------BEGIN MODULE COMPARISON--------------------------------------------------;
;------------------------------------------------------------------------------------------------------;

     (setq j 0)
      (while
	    (<= j (vlax-safearray-get-u-bound arrlist 1))
	  
		(setq currentContractModuleNum (vl-catch-all-apply 'vlax-ldata-get (list "currentRoofModules" (strcat "Roof" (vlax-safearray-get-element arrlist j) "S"))))
		(setq revContractModuleNum (vl-catch-all-apply 'vlax-ldata-get (list "revisionRoofModules" (strcat "Roof" (vlax-safearray-get-element arrlist j) "MRS"))))
			(if
			  (and
			    (= (vl-catch-all-apply 'numberp (list (atoi currentContractModuleNum))) T)
			    (= (vl-catch-all-apply 'numberp (list (atoi revContractModuleNum))) T)
			  )
	      			(progn;execute
			  		(if (= (atoi currentContractModuleNum) (atoi revContractModuleNum))
					  (princ )
					  (if (> (atoi revContractModuleNum) (atoi currentContractModuleNum))
					    (progn
					    	(setq diff(abs(-(atoi revContractModuleNum) (atoi currentContractModuleNum))))
					    	(alert (strcat "(( "(itoa diff) "more modules on " (strcat "Roof" (vlax-safearray-get-element arrlist j)) "))"))
					        
					      (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,_REVISED_LAYOUT"))))
						(progn
						(repeat (setq i (sslength s))
							(if  (= "_REVISED_LAYOUT"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
								(LM:SetVisibilityState g "CHECKED")
							)
						)
						)
      					      )
					    )
					    (progn
					      (setq diff(abs(-(atoi revContractModuleNum) (atoi currentContractModuleNum))))
					      (alert (strcat "(( "(itoa diff) "less modules on " (strcat "Roof" (vlax-safearray-get-element arrlist j)) "))"))
					      
					      (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,_REVISED_LAYOUT"))))
						(progn
						(repeat (setq i (sslength s))
							(if  (= "_REVISED_LAYOUT"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
								(LM:SetVisibilityState g "CHECKED")
							)
						)
						)
      					      )
					    )
					   )
					  )
				  
	      			)
	      			(progn;if the current DWGPROPS key is not equal to the current orientation variable
	        			(princ)
	      			)
	     		);end if
		  	
			(setq j (+ j 1))
	      	);end if
  
;------------------------------------------------------------------------------------------------------;
;-----------------------------END MODULE COMPARISON----------------------------------------------------;
;------------------------------------------------------------------------------------------------------;

;------------------------------------------------------------------------------------------------------;
;-----------------------------BEGIN PITCH COMPARISON---------------------------------------------------;
;------------------------------------------------------------------------------------------------------;
  (setq j 0)
      (while
	    (<= j (vlax-safearray-get-u-bound arrlist 1))
	  
		(setq currentContractPitchNum (vl-catch-all-apply 'vlax-ldata-get (list "currentRoofPitch" (strcat "Roof" (vlax-safearray-get-element arrlist j) "PS"))))
		(setq revContractPitchNum (vl-catch-all-apply 'vlax-ldata-get (list "revisionRoofPitch" (strcat "Roof" (vlax-safearray-get-element arrlist j) "PRS"))))
			(if
			  (and
			    (= (vl-catch-all-apply 'numberp (list (atoi currentContractPitchNum))) T)
			    (= (vl-catch-all-apply 'numberp (list (atoi revContractPitchNum))) T)
			  )
	      			(progn;execute
			  		(if (= (atoi currentContractPitchNum) (atoi revContractPitchNum))
					  (princ )
					  (if (> (atoi revContractPitchNum) (atoi currentContractPitchNum))
					    (progn
					    	(setq diff(abs(-(atoi revContractPitchNum) (atoi currentContractPitchNum))))
					    	(alert (strcat "((Difference of " (itoa diff) " pitch degrees on " (strcat "Roof" (vlax-safearray-get-element arrlist j)) "))"))
					    )
					    (progn
					    	(setq diff(abs(-(atoi revContractPitchNum) (atoi currentContractPitchNum))))
					    	(alert (strcat "((Difference of " (itoa diff) " pitch degrees on " (strcat "Roof" (vlax-safearray-get-element arrlist j)) "))"))
					    )
					  )
					)
				)
				(progn;if the current DWGPROPS key is not equal to the current orientation variable
	        			(princ)
	      			)
	      		)
	      		(setq j (+ j 1))	
	     );end if
;------------------------------------------------------------------------------------------------------;
;-----------------------------END PITCH COMPARISON-----------------------------------------------------;
;------------------------------------------------------------------------------------------------------;

;------------------------------------------------------------------------------------------------------;
;-----------------------------BEGIN ORIENTATION COMPARISON---------------------------------------------;
;------------------------------------------------------------------------------------------------------;
  (setq j 0)
      (while
	    (<= j (vlax-safearray-get-u-bound arrlist 1))
	  
		(setq currentContractOrientationNum (vl-catch-all-apply 'vlax-ldata-get (list "currentRoofOrientation" (strcat "Roof" (vlax-safearray-get-element arrlist j) "OS"))))
		(setq revContractOrientationNum (vl-catch-all-apply 'vlax-ldata-get (list "revisionRoofOrientation" (strcat "Roof" (vlax-safearray-get-element arrlist j) "ORS"))))
			(if
			  (and
			    (= (vl-catch-all-apply 'numberp (list (atoi currentContractOrientationNum))) T)
			    (= (vl-catch-all-apply 'numberp (list (atoi revContractOrientationNum))) T)
			  )
	      			(progn;execute
			  		(if (= (atoi currentContractOrientationNum) (atoi revContractOrientationNum))
					  (princ )
					  (if (> (atoi revContractOrientationNum) (atoi currentContractOrientationNum))
					    (progn
					    	(setq diff(abs(-(atoi revContractOrientationNum) (atoi currentContractOrientationNum))))
					    	(alert (strcat "((Difference of " (itoa diff) " Orientation degrees on " (strcat "Roof" (vlax-safearray-get-element arrlist j)) "))"))
					    )
					    (progn
					    	(setq diff(abs(-(atoi revContractOrientationNum) (atoi currentContractOrientationNum))))
					    	(alert (strcat "((Difference of " (itoa diff) " Orientation degrees on " (strcat "Roof" (vlax-safearray-get-element arrlist j)) "))"))
					    )
					  )
					)
				)
				(progn;if the current DWGPROPS key is not equal to the current orientation variable
	        			(princ)
	      			)
	      		)
	      		(setq j (+ j 1))	
	     );end if
;------------------------------------------------------------------------------------------------------;
;-----------------------------END ORIENTATIOM COMPARISON-----------------------------------------------;
;------------------------------------------------------------------------------------------------------;
  )