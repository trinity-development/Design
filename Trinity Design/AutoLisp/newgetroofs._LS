;-----------------------------------------------------------------------------;
;-----------------------------------------------------------------------------;
;-------------GETS ROOF PARAMETERS FROM EXCEL AND THEN PUTS-------------------;
;---------------THE NUMBER OF MODULES, PITCH AND ORIENTATION------------------;
;--------------INTO DWGPROPS WITH THE SYSTEM BUILDER VALUES-------------------;
;-----------------------------------------------------------------------------;
;-----MADE BY TAMIR LIEBER----------------------------------------------------;
;-----------------------------------------------------------------------------;

(load "getCellsFunction")
(defun c:getroofs()
	
	(setq
	  
	  ;;;;;;;;;;;;;;;;;;;;get roof;;;;;;;;;;;;;;;;;;
	  
		RoofA
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"E120"
			)
		RoofB
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"E121"
			)
		RoofC
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"E122"
			)
		RoofD
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"E123"
			)
		RoofE
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"E124"
			)
		RoofF
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"E125"
			)
		RoofG
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"E126"
			)
		RoofH
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"E127"
			)
		RoofI
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"E128"
			)
		RoofJ
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"E129"
			)
		RoofK
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"E130"
			)
		RoofL
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"E131"
			)
		RoofM
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"E132"
			)
		RoofN
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"E133"
			)
		RoofO
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"E134"
			)
		RoofP
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"E135"
			)
		RoofQ
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"E136"
			)
		RoofR
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"E137"
			)
		RoofS
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"E138"
			)
		RoofT
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"E139"
			)
		RoofU
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"E140"
			)
		RoofV
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"E141"
			)
		RoofW
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"E142"
			)
		RoofX
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"E143"
			)
		RoofY
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"E144"
			)
		RoofZ
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"E145"
			)
		RoofAA
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"E146"
			)
		RoofAB
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"E147"
			)
		RoofAC
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"E148"
			)
		RoofAD
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"E149"
			)
		RoofAE
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"E150"
			)
		RoofAF
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"E151"
			)
		RoofAG
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"E152"
			)
		RoofAH
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"E153"
			)
		RoofAI
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"E154"
			)
		RoofAJ
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"E155"
			)
		RoofAK
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"E156"
			)
		RoofAL
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"E157"
			)
		RoofAM
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"E158"
			)
		RoofAN
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"E159"
			)
		RoofAO
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"E160"
			)
		;;;;;;;;;;;;;end get roof;;;;;;;;;;;;;
		
		;;;;;;;;;;;;get pitch;;;;;;;;;;;;;;;;;
		PitchA
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"F120"
			)
		PitchB
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"F121"
			)
		PitchC
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"F122"
			)
		PitchD
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"F123"
			)
		PitchE
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"F124"
			)
		PitchF
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"F125"
			)
		PitchG
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"F126"
			)
		PitchH
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"F127"
			)
		PitchI
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"F128"
			)
		PitchJ
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"F129"
			)
		PitchK
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"F130"
			)
		PitchL
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"F131"
			)
		PitchM
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"F132"
			)
		PitchN
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"F133"
			)
		PitchO
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"F134"
			)
		PitchP
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"F135"
			)
		PitchQ
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"F136"
			)
		PitchR
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"F137"
			)
		PitchS
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"F138"
			)
		PitchT
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"F139"
			)
		PitchU
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"F140"
			)
		PitchV
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"F141"
			)
		PitchW
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"F142"
			)
		PitchX
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"F143"
			)
		PitchY
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"F144"
			)
		PitchZ
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"F145"
			)
		PitchAA
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"F146"
			)
		PitchAB
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"F147"
			)
		PitchAC
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"F148"
			)
		PitchAD
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"F149"
			)
		PitchAE
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"F150"
			)
		PitchAF
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"F151"
			)
		PitchAG
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"F152"
			)
		PitchAH
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"F153"
			)
		PitchAI
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"F154"
			)
		PitchAJ
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"F155"
			)
		PitchAK
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"F156"
			)
		PitchAL
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"F157"
			)
		PitchAM
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"F158"
			)
		PitchAN
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"F159"
			)
		PitchAO
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"F160"
			)
	;;;;;;;;;;;end get pitch;;;;;;;;;;;;;;

	;;;;;;;;;;get orientation;;;;;;;;;;;
		OrientationA
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"G120"
			)
		OrientationB
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"G121"
			)
		OrientationC
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"G122"
			)
		OrientationD
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"G123"
			)
		OrientationE
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"G124"
			)
		OrientationF
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"G125"
			)
		OrientationG
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"G126"
			)
		OrientationH
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"G127"
			)
		OrientationI
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"G128"
			)
		OrientationJ
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"G129"
			)
		OrientationK
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"G130"
			)
		OrientationL
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"G131"
			)
		OrientationM
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"G132"
			)
		OrientationN
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"G133"
			)
		OrientationO
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"G134"
			)
		OrientationP
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"G135"
			)
		OrientationQ
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"G136"
			)
		OrientationR
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"G137"
			)
		OrientationS
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"G138"
			)
		OrientationT
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"G139"
			)
		OrientationU
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"G140"
			)
		OrientationV
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"G141"
			)
		OrientationW
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"G142"
			)
		OrientationX
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"G143"
			)
		OrientationY
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"G144"
			)
		OrientationZ
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"G145"
			)
		OrientationAA
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"G146"
			)
		OrientationAB
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"G147"
			)
		OrientationAC
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"G148"
			)
		OrientationAD
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"G149"
			)
		OrientationAE
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"G150"
			)
		OrientationAF
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"G151"
			)
		OrientationAG
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"G152"
			)
		OrientationAH
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"G153"
			)
		OrientationAI
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"G154"
			)
		OrientationAJ
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"G155"
			)
		OrientationAK
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"G156"
			)
		OrientationAL
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"G157"
			)
		OrientationAM
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"G158"
			)
		OrientationAN
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"G159"
			)
		OrientationAO
		 	(vl-catch-all-apply 'getcellsfunction (list
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"G160"
			)
		
	;;;;;;;;;;;;;;;;end get orientation;;;;;;;;;;;;;;
		RevNum1
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"FORM" 
				"D31"
			)
		RevNum2
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"FORM" 
				"D30"
			)
		RevNum3
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"FORM" 
				"D29"
			)
		RevNum4
		 	(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"FORM" 
				"D28"
			)
	);setq
  	


  
  	(setq drawing (vla-get-summaryinfo (vla-get-activedocument (vlax-get-acad-object))));MUST HAVE FOR PERFOMING DWGPROPS MANIPULATION
        (setq alphalist '("A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z" "AA" "AB" "AC" "AD" "AE" "AF" "AG" "AH" "AI" "AJ" "AK" "AL" "AM" "AN" "AO"));list for Salesforce variables
	

	(setq orientationcount 0)
	(foreach n alphalist
	  (setq keycount2 0
	        orientationbinary1 0
	  )
	  (while;do until
	    (and;both
	    	(< keycount2 (vla-numcustominfo drawing));go through the whole DWGPROPS until the last key
		(= orientationbinary1 0);the pitch binary variable is not equal to 0
	    )
	    (vla-getcustombyindex;get current numbered index from DWGPROPS
	      drawing
	      keycount2
	      'tempkeyname2
	      'tempkeyvalue2
	    )
	    
	    (if (/= (eval(read (strcat "Orientation" n))) "");if the current orientation variable is not empty
	      
	      (if (= (+ keycount2 1) (vla-numcustominfo drawing));if this is the last key
	    	(if (= "OS" (substr tempkeyname2 (- (strlen tempkeyname2) 1)));if the current key is a Salesforce orientation
	    		(if (= tempkeyname2 (eval(read (strcat "Orientation" n))));if the current DWGPROPS key is equal to the current orientation variable
	      			(progn;execute
	      				(vla-removecustombykey drawing tempkeyname2);delete current DWGPROPS key
  					(vla-addcustominfo drawing;add current Salesforce orientation from Excel as the key and the orientation number as the value
	  					(eval(read (strcat "Orientation" n)));Salesforce orientation number
						(getcellsfunction
		  					(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 					"CURRENT EXCEL ROOFS"
							(strcat "N" (itoa(+ orientationcount 3)));orientation number on that roof
			 			)
					)
			  		(setq orientationbinary1 1);move on to next Salesforce orientation
	      			)
	      			(progn;if the current DWGPROPS key is not equal to the current orientation variable
	        			(vla-addcustominfo drawing;add current Salesforce orientation from Excel as the key and the orientation number as the value
	  					(eval(read (strcat "Orientation" n)));Salesforce orientaion number
						(getcellsfunction
		  					(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 					"CURRENT EXCEL ROOFS"
							(strcat "N" (itoa(+ orientationcount 3)));number of modules on that orientation
			 			)
					)
			  		(setq orientationbinary1 1);move on to next Salesforce orientation
	      			)
	     		);end if
		  	(vla-addcustominfo drawing;add current Salesforce orientation from Excel as the key and the orientation number as the value
	  					(eval(read (strcat "Orientation" n)));Salesforce orientation number
						(getcellsfunction
		  					(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 					"CURRENT EXCEL ROOFS"
							(strcat "N" (itoa(+ orientationcount 3)));orientation number on that roof
			 			)
					)
	      	);end if
		;if this is not the last key
		(if (= "OS" (substr tempkeyname2 (- (strlen tempkeyname2) 1)));if the current key is a Salesforce orientation
	    		(if (= tempkeyname2 (eval(read (strcat "Orientation" n))));if the current DWGPROPS key is equal to the current orientation variable
	      			(progn;execute
	      				(vla-removecustombykey drawing tempkeyname2);delete current DWGPROPS key
  					(vla-addcustominfo drawing;add current Salesforce orientation from Excel as the key and the orientation number as the value
	  					(eval(read (strcat "Orientation" n)));Salesforce orientation number
						(getcellsfunction
		  					(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 					"CURRENT EXCEL ROOFS"
							(strcat "N" (itoa(+ orientationcount 3)));orientation number on that roof
			 			)
					)
			  		(setq orientationbinary1 1);move on to next Salesforce orientation
	      			)
	      			
	     		);end if
	      	);end if
	       );end if
	     
	      );end if
	    	(setq keycount2 (+ keycount2 1));next key in DWGPROPS
	    );end while
	  (setq orientationcount (+ orientationcount 1));next cell in Excel Template for orientation number
	);endforeach

  ;;;;;;;;;;;;;;;;;;;;;;;;;end Salesforce orientation to DWG PROPS;;;;;;;;;;;;;;;;;;;;;
  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;end Salesforce pitch to DWG Props;;;;;;;;;;;; 
  (setq pitchcount 0)
  	(foreach n alphalist
	  (setq keycount1 0
	        pitchbinary1 0
	  )
	  (while;do until
	    (and;both
	    	(< keycount1 (vla-numcustominfo drawing));go through the whole DWGPROPS until the last key
		(= pitchbinary1 0);the pitch binary variable is not equal to 0
	    )
	    (vla-getcustombyindex;get current numbered index from DWGPROPS
	      drawing
	      keycount1
	      'tempkeyname1
	      'tempkeyvalue1
	    )
	    
	    (if (/= (eval(read (strcat "Pitch" n))) "");if the current pitch variable is not empty
	      
	      (if (= (+ keycount1 1) (vla-numcustominfo drawing));if this is the last key
	    	(if (= "PS" (substr tempkeyname1 (- (strlen tempkeyname1) 1)));if the current key is a Salesforce pitch
	    		(if (= tempkeyname1 (eval(read (strcat "Pitch" n))));if the current DWGPROPS key is equal to the current pitch variable
	      			(progn;execute
	      				(vla-removecustombykey drawing tempkeyname1);delete current DWGPROPS key
  					(vla-addcustominfo drawing;add current Salesforce pitch from Excel as the key and the pitch number as the value
	  					(eval(read (strcat "Pitch" n)));Salesforce pitch number
						(getcellsfunction
		  					(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 					"CURRENT EXCEL ROOFS"
							(strcat "M" (itoa(+ pitchcount 3)));pitch number on that roof
			 			)
					)
			  		(setq pitchbinary1 1);move on to next Salesforce pitch
	      			)
	      			(progn;if the current DWGPROPS key is not equal to the current pitch variable
	        			(vla-addcustominfo drawing;add current Salesforce pitch from Excel as the key and the pitch number as the value
	  					(eval(read (strcat "Pitch" n)));Salesforce pitch number
						(getcellsfunction
		  					(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 					"CURRENT EXCEL ROOFS"
							(strcat "M" (itoa(+ pitchcount 3)));number of modules on that pitch
			 			)
					)
			  		(setq pitchbinary1 1);move on to next Salesforce pitch
	      			)
	     		);end if
		  	(vla-addcustominfo drawing;add current Salesforce Pitch from Excel as the key and the amount of modules as the value
	  					(eval(read (strcat "Pitch" n)));Salesforce pitch number
						(getcellsfunction
		  					(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 					"CURRENT EXCEL ROOFS"
							(strcat "M" (itoa(+ pitchcount 3)));pitch number on that roof
			 			)
					)
	      	);end if
		;if this is not the last key
		(if (= "PS" (substr tempkeyname1 (- (strlen tempkeyname1) 1)));if the current key is a Salesforce pitch
	    		(if (= tempkeyname1 (eval(read (strcat "Pitch" n))));if the current DWGPROPS key is equal to the current pitch variable
	      			(progn;execute
	      				(vla-removecustombykey drawing tempkeyname1);delete current DWGPROPS key
  					(vla-addcustominfo drawing;add current Salesforce pitch from Excel as the key and the pitch number as the value
	  					(eval(read (strcat "Pitch" n)));Salesforce pitch number
						(getcellsfunction
		  					(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 					"CURRENT EXCEL ROOFS"
							(strcat "M" (itoa(+ pitchcount 3)));pitch number on that roof
			 			)
					)
			  		(setq pitchbinary1 1);move on to next Salesforce pitch
	      			)
	      			
	     		);end if
	      	);end if
	       );end if
	     
	      );end if
	    	(setq keycount1 (+ keycount1 1));next key in DWGPROPS
	    );end while
	  (setq pitchcount (+ pitchcount 1));next cell in Excel Template for pitch number
	);endforeach

  ;;;;;;;;;;;;;;;;;;;;;;;;END BRING IN SALESFORCE PITCH;;;;;;;;;;;;;;;;;;;;;;;
  
  ;;;;;;;;;;;;;;BRING IN SALESFORCE ROOFS FROM EXCEL AND PLACE THEM IN DWGPROPS;;;;;;;;;;;;
  
      
        (setq modcount 0)
  	(foreach n alphalist
	  (setq keycount 0
	        roofbinary 0
	  )
	  (while;do until
	    (and;both
	    	(< keycount (vla-numcustominfo drawing));go through the whole DWGPROPS until the last key
		(= roofbinary 0);the roof binary variable is not equal to 0
	    )
	    (vla-getcustombyindex;get current numbered index from DWGPROPS
	      drawing
	      keycount
	      'tempkeyname
	      'tempkeyvalue
	    )
	    
	    (if (/= (eval(read (strcat "Roof" n))) "");if the current Roof variable is not empty
	      
	      (if (= (+ keycount 1) (vla-numcustominfo drawing));if this is the last key
	    	(if (= "S" (substr tempkeyname (- (strlen tempkeyname) 0)));if the current key is a Salesforce roof
	    		(if (= tempkeyname (eval(read (strcat "Roof" n))));if the current DWGPROPS key is equal to the current Roof variable
	      			(progn;execute
	      				(vla-removecustombykey drawing tempkeyname);delete current DWGPROPS key
  					(vla-addcustominfo drawing;add current Salesforce Roof from Excel as the key and the amount of modules as the value
	  					(eval(read (strcat "Roof" n)));Salesforce Roof number
						(getcellsfunction
		  					(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 					"CURRENT EXCEL ROOFS"
							(strcat "L" (itoa(+ modcount 3)));number of modules on that roof
			 			)
					)
			  		(setq roofbinary 1);move on to next Salesforce roof
	      			)
	      			(progn;if the current DWGPROPS key is not equal to the current Roof variable
	        			(vla-addcustominfo drawing;add current Salesforce Roof from Excel as the key and the amount of modules as the value
	  					(eval(read (strcat "Roof" n)));Salesforce Roof number
						(getcellsfunction
		  					(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 					"CURRENT EXCEL ROOFS"
							(strcat "L" (itoa(+ modcount 3)));number of modules on that roof
			 			)
					)
			  		(setq roofbinary 1);move on to next Salesforce roof
	      			)
	     		);end if
	      	);end if
		;if this is not the last key
		(if (= "S" (substr tempkeyname (- (strlen tempkeyname) 0)));if the current key is a Salesforce roof
	    		(if (= tempkeyname (eval(read (strcat "Roof" n))));if the current DWGPROPS key is equal to the current Roof variable
	      			(progn;execute
	      				(vla-removecustombykey drawing tempkeyname);delete current DWGPROPS key
  					(vla-addcustominfo drawing;add current Salesforce Roof from Excel as the key and the amount of modules as the value
	  					(eval(read (strcat "Roof" n)));Salesforce Roof number
						(getcellsfunction
		  					(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 					"CURRENT EXCEL ROOFS"
							(strcat "L" (itoa(+ modcount 3)));number of modules on that roof
			 			)
					)
			  		(setq roofbinary 1);move on to next Salesforce roof
	      			)
	      			
	     		);end if
	      	);end if
	       );end if
	     
	      );end if
	    	(setq keycount (+ keycount 1));next key in DWGPROPS
	    );end while
	  (setq modcount (+ modcount 1));next cell in Excel Template for modules
	);endforeach
  
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;END BRING IN SALESFORCE ROOFS;;;;;;;;;;;;;;;;

)