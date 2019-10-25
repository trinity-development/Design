;-----------------------------------------------------------------------------;
;-----------------------------------------------------------------------------;
;-------------GETS ROOF PARAMETERS FROM EXCEL AND THEN PUTS-------------------;
;---------------THE NUMBER OF MODULES, PITCH AND ORIENTATION------------------;
;--------------INTO DWGPROPS WITH THE SYSTEM BUILDER VALUES-------------------;
;-----------------------------------------------------------------------------;
;-----MADE BY TAMIR LIEBER----------------------------------------------------;
;-----------------------------------------------------------------------------;

(load "getCellsFunction")
(defun c:getroofsnew()
	(setq start (getvar "MILLISECS"))
	(setq
	  cellarr (vlax-make-safearray vlax-vbstring '(0 . 40));make excel row array
		    
	  alphalist (vlax-make-safearray vlax-vbstring '(0 . 40))
	   	    
	  i 0
	  arrayElement 0
	  )
	(vlax-safearray-fill cellarr '("120" "121" "122" "123" "124" "125" "126" "127" "128" "129" "130" "131" "132" "133" "134" "135" "136" "137" "138" "139" "140" "141" "142" "143" "144" "145"
		    "146" "147" "148" "149" "150" "151" "152" "153" "154" "155" "156" "157" "158" "159" "160"));LIST OF ROWS TO TAKE IN EXCEL
  	(vlax-safearray-fill alphalist '("A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z" "AA" "AB" "AC" "AD" "AE" "AF" "AG" "AH"
			    "AI" "AJ" "AK" "AL" "AM" "AN" "AO"));list for EXCEL variables
  		
  		(while;while these conditions are met run
		  (and
		    (< i (vlax-safearray-get-u-bound cellarr 1));the variable i is less than the cellarr array
		    (/= arrayElement nil);the current variable information from Excel is not empty
		  )
		  	(set (read (strcat "Roof" (vlax-safearray-get-element alphalist i)));ASSIGN THE ROOF VARIABLE AS THE MODULE NUMBER FROM EXCEL
		    		(vl-catch-all-apply 'getcellsfunction  (list;get information from 
					(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
					"CALCULATIONS" 
					(strcat "E" (vlax-safearray-get-element cellarr i))
					)
		    		)
		  	)
			(setq
			  arrayElement (eval(read (strcat "Roof" (vlax-safearray-get-element alphalist i))));ASSIGN THE CURRENT MODULE INFORMATION FOR THE ROOF TO THE VARIABLE arrayElement
			  i (+ i 1)
			)
		)
		

  		
  		(setq arrayElement 0
		      i 0)
  		(while;while these conditions are met run
		  (and
		    (< i (vlax-safearray-get-u-bound cellarr 1));the variable i is less than the cellarr array
		    (/= arrayElement nil);the current variable information from Excel is not empty
		  )
		  
		  (set (read (strcat "Pitch" (vlax-safearray-get-element alphalist i)));ASSIGN THE PITCH VARIABLE AS THE PITCH NUMBER FROM EXCEL
		    (vl-catch-all-apply 'getcellsfunction  (list
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				(strcat "F" (vlax-safearray-get-element cellarr i))
				)
		    )
		  )
		  (setq
		    arrayElement (eval(read (strcat "Pitch" (vlax-safearray-get-element alphalist i))));ASSIGN THE CURRENT PITCH INFORMATION FOR THE ROOF TO THE VARIABLE arrayElement
		    
		    i (+ i 1)
		    )
		 )
		

  		(setq arrayElement 0
		      i 0)
		 (while;while these conditions are met run
		   (and
		    (< i (vlax-safearray-get-u-bound cellarr 1));the variable i is less than the cellarr array
		    (/= arrayElement nil);the current variable information from Excel is not empty
		  )
		  (set (read (strcat "Orientation" (vlax-safearray-get-element alphalist i)));ASSIGN THE ORIENTATION VARIABLE AS THE ORIENTATION NUMBER FROM EXCEL
		    (vl-catch-all-apply 'getcellsfunction  (list
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				(strcat "G" (vlax-safearray-get-element cellarr i))
				)
		    )
		  )
		   (setq
		     arrayElement (eval(read (strcat "Orientation" (vlax-safearray-get-element alphalist i))));ASSIGN THE CURRENT ORIENTATION INFORMATION FOR THE ROOF TO THE VARIABLE arrayElement
		     
		     i (+ i 1)
		     )
		   
		 )				

  	(setq drawing (vla-get-summaryinfo (vla-get-activedocument (vlax-get-acad-object))));MUST HAVE FOR PERFOMING DWGPROPS MANIPULATION
        (setq alphalist (vlax-make-safearray vlax-vbstring '(0 . 40)))
	  (vlax-safearray-fill alphalist '("A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z" "AA" "AB" "AC" "AD" "AE" "AF"
					   "AG" "AH" "AI" "AJ" "AK" "AL" "AM" "AN" "AO"));list for Salesforce variables

  ;;;;;;;;;;;;;;;start orientation;;;;;;;;;;;;;;;;;;;;
	
	(setq n 0)
  	(setq alphaElement 0)
	(setq orientationcount 0)
	(while (and
		 (< n (vlax-safearray-get-u-bound alphalist 1))
		 (/= alphaElement nil)
	   	)
	  (setq 
	        orientationbinary1 0
	  )
	  (while;do while conditions are met
		(= orientationbinary1 0);the pitch binary variable is not equal to 0
	      (setq currentOrientationCheck (eval(read(strcat "Orientation" (vlax-safearray-get-element alphalist n)))))
		(setq currentOrientationNum (getcellsfunction (strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 	          		"CURRENT EXCEL ROOFS"
				  		(strcat "N" (itoa(+ orientationcount 3)));orientation number on that roof
					    )
		 )
	    ;(alert currentOrientationCheck)
	    ;(alert currentOrientationNum)
	    
	    		(if (= (vl-catch-all-apply 'vlax-ldata-get (list "currentRoofOrientation" currentOrientationCheck)) "NA");if the current DWGPROPS key is equal to the current orientation variable
			  	
	      			(progn;execute
				  	
  					(vlax-ldata-put "currentRoofOrientation" currentOrientationCheck currentOrientationNum)
			  		(setq orientationbinary1 1);move on to next Salesforce orientation
	      			);end progn
			  	(if (= (vl-catch-all-apply 'vlax-ldata-get (list "currentRoofOrientation" currentOrientationCheck)) currentOrientationNum)
			  		(progn
	      					;(alert "check Orientation dictionary")
			    			(setq orientationbinary1 1)
			  		)
				  	(if (/= (vl-catch-all-apply 'vlax-ldata-get (list "currentRoofOrientation" currentOrientationCheck)) nil)
				  		(progn;execute
						  	
  							(vl-catch-all-apply 'vlax-ldata-put (list "currentRoofOrientation" currentOrientationCheck currentOrientationNum))
			  				(setq orientationbinary1 1);move on to next Salesforce orientation
	      					)
					  	(progn
						  	(setq orientationbinary1 1);move on to next Salesforce orientation
						)
					);end if
				 );end if
	      		);end if
	       
	     
	      
	    
	    );end while
	  (setq orientationcount (+ orientationcount 1));next cell in Excel Template for orientation number
	  (setq alphaElement currentOrientationCheck)
	  (setq n (+ n 1))
	);endwhile

  ;;;;;;;;;;;;;;;;;;;;;;;;;end Salesforce orientation to DWG PROPS;;;;;;;;;;;;;;;;;;;;;
  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;start Salesforce pitch to DWG Props;;;;;;;;;;;;

  (setq n 0)
  	(setq alphaElement 0)
  (setq pitchcount 0)
  	(while (and
		 (< n (vlax-safearray-get-u-bound alphalist 1))
		 (/= alphaElement nil)
	   	)
	  (setq keycount1 0
	        pitchbinary1 0
	  )
	  (while;do while
		(= pitchbinary1 0);the pitch binary variable is not equal to 0
	    (setq currentPitchCheck (eval(read (strcat "Pitch" (vlax-safearray-get-element alphalist n)))))
	    (setq currentPitchNum (getcellsfunction
		  			(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 			"CURRENT EXCEL ROOFS"
					(strcat "M" (itoa(+ pitchcount 3)));orientation number on that roof
			 	  )
	    )
		;(alert currentPitchCheck)
	    	;(alert (vlax-ldata-get "currentRoofPitch" currentPitchCheck))
	    
	    		(if (= (vl-catch-all-apply 'vlax-ldata-get (list "currentRoofPitch" currentPitchCheck)) "NA");if the current DWGPROPS key is equal to the current pitch variable
	      			(progn;execute
	   				(vlax-ldata-put "currentRoofPitch" currentPitchCheck currentPitchNum)
			  		(setq pitchbinary1 1);move on to next Salesforce pitch
	      			)
			  	(if (= (vl-catch-all-apply 'vlax-ldata-get (list "currentRoofPitch" currentPitchCheck)) nil)
			  		(progn
	      					;(alert "check Orientation dictionary")
			    			(setq pitchbinary1 1)
			  		)
				  	(if (/= (vl-catch-all-apply 'vlax-ldata-get (list "currentRoofPitch" currentPitchCheck)) currentPitchNum)
				  		(progn;execute
  							(vl-catch-all-apply 'vlax-ldata-put (list "currentRoofPitch" currentPitchCheck currentPitchNum))
			  				(setq pitchbinary1 1);move on to next Salesforce orientation
	      					)
					  	(progn
						  	(setq pitchbinary1 1);move on to next Salesforce orientation
						)
					 );end if
				 );end if
	     		);end if
	      	
	    );end while
	  (setq pitchcount (+ pitchcount 1));next cell in Excel Template for pitch number
	  (setq alphaElement currentPitchCheck)
	  (setq n (+ n 1))
	);end while

  ;;;;;;;;;;;;;;;;;;;;;;;;END BRING IN SALESFORCE PITCH;;;;;;;;;;;;;;;;;;;;;;;
  
  ;;;;;;;;;;;;;;BRING IN SALESFORCE ROOFS FROM EXCEL AND PLACE THEM IN DWGPROPS;;;;;;;;;;;;
  
       (setq n 0)
  	(setq alphaElement 0)
        (setq modcount 0)
  	(while;do while both conditions are met
	  	(and
		 (< n (vlax-safearray-get-u-bound alphalist 1));the end of the alphalist array and
		 (/= alphaElement nil)
	   	)
	  (setq keycount 0
	        roofbinary 0
	  )
	  (while;do until

		(= roofbinary 0);the roof binary variable is not equal to 0
	    	(setq currentModuleCheck (eval(read (strcat "Roof" (vlax-safearray-get-element alphalist n)))))
	    	(setq currentModuleNum (getcellsfunction
		  				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 					"CURRENT EXCEL ROOFS"
							(strcat "L" (itoa(+ modcount 3)));orientation number on that roof
			 		)
		 )
	    	
	    		(if (= (vl-catch-all-apply 'vlax-ldata-get (list "currentRoofModules" currentModuleCheck)) "NA");if the current DWGPROPS key is equal to the current Roof variable
	      			(progn;execute
				  	
	   				(vlax-ldata-put "currentRoofModules" currentModuleCheck currentModuleNum)
			  		(setq roofbinary 1);move on to next Salesforce pitch
	      			)
			  	(if (= (vl-catch-all-apply 'vlax-ldata-get (list "currentRoofModules" currentModuleCheck)) currentModuleNum)
			  		(progn
				  		;(alert "check Module dictionary!")
					  
				  		(setq roofbinary 1)
					)
	      				(if(/= (vl-catch-all-apply 'vlax-ldata-get (list "currentRoofModules" currentModuleCheck)) nil)
					  	(progn;execute
						  
  							(vl-catch-all-apply 'vlax-ldata-put (list "currentRoofModules" currentModuleCheck currentModuleNum))
			  				(setq roofbinary 1);move on to next Salesforce orientation
	      					)
					  	(progn
						  
						  	(setq roofbinary 1);move on to next Salesforce orientation
						)
					);end if
				  );end if
	     		);end if
	      	
	    );end while
	  (setq modcount (+ modcount 1));next cell in Excel Template for modules
	  (setq alphaElement currentModuleCheck)
	  (setq n (+ n 1))
	);end while
  
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;END BRING IN SALESFORCE ROOFS;;;;;;;;;;;;;;;;
  (princ (vlax-ldata-list "currentRoofModules"))
  (princ "\n")
  (princ (vlax-ldata-list "currentRoofPitch"))
  (princ "\n")
  (princ (vlax-ldata-list "currentRoofOrientation"))
  (princ "\n")
(setq end (getvar "MILLISECS"))
  (princ (itoa (- end start)))
)