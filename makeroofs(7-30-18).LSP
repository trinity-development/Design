;-----------------------------------------------------------------------------;
;-----------------------------------------------------------------------------;
;-------------SETS ALL ORIENTATIONS, PITCH AND MODULES------------------------;
;---------------SYSTEM BUILDER VARIABLES TO "N/A"-----------------------------;
;-----------------------------------------------------------------------------;
;-----------------------------------------------------------------------------;
;-----MADE BY TAMIR LIEBER----------------------------------------------------;
;-----------------------------------------------------------------------------;

(defun c:makeroofs()
  (setq start (getvar "MILLISECS"))
  (setq numlist '("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14" "15" "16" "17" "18" "19" "20"
		  "21" "22" "23" "24" "25" "26" "27" "28" "29" "30" "31" "32" "33" "34" "35" "36" "37" "38" "39" "40"))
  (setq drawing (vla-get-summaryinfo (vla-get-activedocument (vlax-get-acad-object))));MUST HAVE FOR PERFOMING DWGPROPS MANIPULATION
  
;--------------------------------------------------------------------------------------------------------------------------------------------------------------;
;----------------------------------------------------------BEGIN MAKE ROOF ORIENTATION-------------------------------------------------------------------------;
;--------------------------------------------------------------------------------------------------------------------------------------------------------------;
  
  (foreach n numlist
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
	    
	    
	      
	      (if (= (+ keycount2 1) (vla-numcustominfo drawing));if this is the last key
	    	(if (= "OS" (substr tempkeyname2 (- (strlen tempkeyname2) 1)))
	    		(if (= tempkeyname2 (strcat "Roof" n "OS"));if the current DWGPROPS key is equal to the current orientation variable
	      			(progn;execute
	      				(vla-setcustombykey drawing (strcat "Roof" n "OS") "NA");delete current DWGPROPS key
			  		(setq orientationbinary1 1);move on to next Salesforce orientation
	      			)
	      			(progn;if the current DWGPROPS key is not equal to the current orientation variable
	        			(vla-addcustominfo drawing (strcat "Roof" n "OS") "NA");add current Salesforce orientation from Excel as the key and the orientation number as the value
			  		(setq orientationbinary1 1);move on to next Salesforce orientation
	      			)
	     		);end if
		    (progn;if the current DWGPROPS key is not equal to the current orientation variable
	        			(vla-addcustominfo drawing (strcat "Roof" n "OS") "NA");add current Salesforce orientation from Excel as the key and the orientation number as the value
			  		(setq orientationbinary1 1);move on to next Salesforce orientation
	      			)
		  )
	      	
		;if this is not the last key
		  (if (= "OS" (substr tempkeyname2 (- (strlen tempkeyname2) 1)))
	    		(if (= tempkeyname2 (strcat "Roof" n "OS"));if the current DWGPROPS key is equal to the current orientation variable
	      			(progn;execute
	      				(vla-setcustombykey drawing (strcat "Roof" n "OS") "NA");delete current DWGPROPS key
  					;add current Salesforce orientation from Excel as the key and the orientation number as the value
			  		(setq orientationbinary1 1);move on to next Salesforce orientation
	      			)
	      			(princ)
	     		);end if
	      	  );end if
	       );end if
	     
	     
	    	(setq keycount2 (+ keycount2 1));next key in DWGPROPS
	    );end while
	  
	);foreach
  
;--------------------------------------------------------------------------------------------------------------------------------------------------------------;
;----------------------------------------------------------END MAKE ROOF ORIENTATION---------------------------------------------------------------------------;
;--------------------------------------------------------------------------------------------------------------------------------------------------------------;

;--------------------------------------------------------------------------------------------------------------------------------------------------------------;
;----------------------------------------------------------BEGIN MAKE ROOF PITCH-------------------------------------------------------------------------------;
;--------------------------------------------------------------------------------------------------------------------------------------------------------------;
  
  (foreach n numlist
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
	      (if (= (+ keycount1 1) (vla-numcustominfo drawing));if this is the last key
	    	(if (= "PS" (substr tempkeyname1 (- (strlen tempkeyname1) 1)))
	    		(if (= tempkeyname1 (strcat "Roof" n "PS"));if the current DWGPROPS key is equal to the current orientation variable
	      			(progn;execute
	      				(vla-setcustombykey drawing (strcat "Roof" n "PS") "NA");delete current DWGPROPS key
			  		(setq pitchbinary1 1);move on to next Salesforce orientation
	      			)
	      			(progn;if the current DWGPROPS key is not equal to the current orientation variable
	        			(vla-addcustominfo drawing (strcat "Roof" n "PS") "NA");add current Salesforce orientation from Excel as the key and the orientation number as the value
			  		(setq pitchbinary1 1);move on to next Salesforce orientation
	      			)
	     		);end if
		    (progn;if the current DWGPROPS key is not equal to the current orientation variable
	        			(vla-addcustominfo drawing (strcat "Roof" n "PS") "NA");add current Salesforce orientation from Excel as the key and the orientation number as the value
			  		(setq pitchbinary1 1);move on to next Salesforce orientation
	      			)
		  );endif	
	      	
		;if this is not the last key
		  (if (= "PS" (substr tempkeyname1 (- (strlen tempkeyname1) 1)))
	    		(if (= tempkeyname1 (strcat "Roof" n "PS"));if the current DWGPROPS key is equal to the current orientation variable
	      			(progn;execute
	      				(vla-setcustombykey drawing (strcat "Roof" n "PS") "NA");delete current DWGPROPS key
			  		(setq pitchbinary1 1);move on to next Salesforce orientation
	      			)
	      			(princ)
	     		);end if
	      	  );end if
	       );end if
	    	(setq keycount1 (+ keycount1 1));next key in DWGPROPS
	    );end while
	  
	);foreach

;--------------------------------------------------------------------------------------------------------------------------------------------------------------;
;----------------------------------------------------------END MAKE ROOF ORIENTATION---------------------------------------------------------------------------;
;--------------------------------------------------------------------------------------------------------------------------------------------------------------;

;--------------------------------------------------------------------------------------------------------------------------------------------------------------;
;----------------------------------------------------------BEGIN MAKE ROOF MODULES-----------------------------------------------------------------------------;
;--------------------------------------------------------------------------------------------------------------------------------------------------------------;
  
  (foreach n numlist
	  (setq keycount0 0
	        modbinary1 0
	  )
	  (while;do until
	    (and;both
	    	(< keycount0 (vla-numcustominfo drawing));go through the whole DWGPROPS until the last key
		(= modbinary1 0);the pitch binary variable is not equal to 0
	    )
	    (vla-getcustombyindex;get current numbered index from DWGPROPS
	      drawing
	      keycount0
	      'tempkeyname0
	      'tempkeyvalue0
	    )
	      (if (= (+ keycount0 1) (vla-numcustominfo drawing));if this is the last key
	    	(if (= "S" (substr tempkeyname0 (- (strlen tempkeyname0) 0)))
	    		(if (= tempkeyname0 (strcat "Roof" n "S"));if the current DWGPROPS key is equal to the current orientation variable
	      			(progn;execute
	      				(vla-setcustombykey drawing (strcat "Roof" n "S") "NA");delete current DWGPROPS key
			  		(setq pitchbinary1 1);move on to next Salesforce orientation
	      			)
	      			(progn;if the current DWGPROPS key is not equal to the current orientation variable
	        			(vla-addcustominfo drawing (strcat "Roof" n "S") "NA");add current Salesforce orientation from Excel as the key and the orientation number as the value
			  		(setq modbinary1 1);move on to next Salesforce orientation
	      			)
	     		);end if
		    (progn;if the current DWGPROPS key is not equal to the current orientation variable
	        			(vla-addcustominfo drawing (strcat "Roof" n "S") "NA");add current Salesforce orientation from Excel as the key and the orientation number as the value
			  		(setq modbinary1 1);move on to next Salesforce orientation
	      			)
		  );end if
	      	
		;if this is not the last key
		  (if (= "S" (substr tempkeyname0 (- (strlen tempkeyname0) 0)))
	    		(if (= tempkeyname0 (strcat "Roof" n "S"));if the current DWGPROPS key is equal to the current orientation variable
	      			(progn;execute
	      				(vla-setcustombykey drawing (strcat "Roof" n "S") "NA");delete current DWGPROPS key
			  		(setq modbinary1 1);move on to next Salesforce orientation
	      			)
	      			(princ)
	     		);end if
	      	  );end if
	       );end if
	    	(setq keycount0 (+ keycount0 1));next key in DWGPROPS
	    );end while
	  
	);foreach

;--------------------------------------------------------------------------------------------------------------------------------------------------------------;
;----------------------------------------------------------END MAKE ROOF MODULES-------------------------------------------------------------------------------;
;--------------------------------------------------------------------------------------------------------------------------------------------------------------;

;--------------------------------------------------------------------------------------------------------------------------------------------------------------;
;------------------------------------------------------------BEGIN ROOF SNAPSHOT ROOFS-------------------------------------------------------------------------;
;--------------------------------------------------------------------------------------------------------------------------------------------------------------;
;--------------------------------------------------------------------------------------------------------------------------------------------------------------;
;----------------------------------------------------------BEGIN MAKE ROOF ORIENTATION-------------------------------------------------------------------------;
;--------------------------------------------------------------------------------------------------------------------------------------------------------------;
  
  (foreach n numlist
	  (setq keycount3 0
	        orientationbinary2 0
	  )
	  (while;do until
	    (and;both
	    	(< keycount3 (vla-numcustominfo drawing));go through the whole DWGPROPS until the last key
		(= orientationbinary2 0);the pitch binary variable is not equal to 0
	    )
	    (vla-getcustombyindex;get current numbered index from DWGPROPS
	      drawing
	      keycount3
	      'tempkeyname3
	      'tempkeyvalue3
	    )
	    
	    
	      
	      (if (= (+ keycount3 1) (vla-numcustominfo drawing));if this is the last key
	    	(if (= "ORS" (substr tempkeyname3 (- (strlen tempkeyname3) 2)))
	    		(if (= tempkeyname3 (strcat "Roof" n "ORS"));if the current DWGPROPS key is equal to the current orientation variable
	      			(progn;execute
	      				(vla-setcustombykey drawing (strcat "Roof" n "ORS") "NA");delete current DWGPROPS key
			  		(setq orientationbinary2 1);move on to next Salesforce orientation
	      			)
	      			(progn;if the current DWGPROPS key is not equal to the current orientation variable
	        			(vla-addcustominfo drawing (strcat "Roof" n "ORS") "NA");add current Salesforce orientation from Excel as the key and the orientation number as the value
			  		(setq orientationbinary2 1);move on to next Salesforce orientation
	      			)
	     		);end if
		    (progn;if the current DWGPROPS key is not equal to the current orientation variable
	        			(vla-addcustominfo drawing (strcat "Roof" n "ORS") "NA");add current Salesforce orientation from Excel as the key and the orientation number as the value
			  		(setq orientationbinary2 1);move on to next Salesforce orientation
	      		)
		  
		  )
	      	
		;if this is not the last key
		  (if (= "ORS" (substr tempkeyname3 (- (strlen tempkeyname3) 2)))
	    		(if (= tempkeyname3 (strcat "Roof" n "ORS"));if the current DWGPROPS key is equal to the current orientation variable
	      			(progn;execute
	      				(vla-setcustombykey drawing (strcat "Roof" n "ORS") "NA");delete current DWGPROPS key
  					;add current Salesforce orientation from Excel as the key and the orientation number as the value
			  		(setq orientationbinary2 1);move on to next Salesforce orientation
	      			)
	      			(princ)
	     		);end if
	      	  );end if
	       );end if
	     
	     
	    	(setq keycount3 (+ keycount3 1));next key in DWGPROPS
	    );end while
	  
	);foreach
  
;--------------------------------------------------------------------------------------------------------------------------------------------------------------;
;----------------------------------------------------------END MAKE ROOF ORIENTATION---------------------------------------------------------------------------;
;--------------------------------------------------------------------------------------------------------------------------------------------------------------;

;--------------------------------------------------------------------------------------------------------------------------------------------------------------;
;----------------------------------------------------------BEGIN MAKE ROOF PITCH-------------------------------------------------------------------------------;
;--------------------------------------------------------------------------------------------------------------------------------------------------------------;
  
  (foreach n numlist
	  (setq keycount4 0
	        pitchbinary2 0
	  )
	  (while;do until
	    (and;both
	    	(< keycount4 (vla-numcustominfo drawing));go through the whole DWGPROPS until the last key
		(= pitchbinary2 0);the pitch binary variable is not equal to 0
	    )
	    (vla-getcustombyindex;get current numbered index from DWGPROPS
	      drawing
	      keycount4
	      'tempkeyname4
	      'tempkeyvalue4
	    )
	      (if (= (+ keycount4 1) (vla-numcustominfo drawing));if this is the last key
	    	(if (= "PRS" (substr tempkeyname4 (- (strlen tempkeyname4) 2)))
	    		(if (= tempkeyname4 (strcat "Roof" n "PRS"));if the current DWGPROPS key is equal to the current orientation variable
	      			(progn;execute
	      				(vla-setcustombykey drawing (strcat "Roof" n "PRS") "NA");delete current DWGPROPS key
			  		(setq pitchbinary2 1);move on to next Salesforce orientation
	      			)
	      			(progn;if the current DWGPROPS key is not equal to the current orientation variable
	        			(vla-addcustominfo drawing (strcat "Roof" n "PRS") "NA");add current Salesforce orientation from Excel as the key and the orientation number as the value
			  		(setq pitchbinary2 1);move on to next Salesforce orientation
	      			)
	     		);end if
		    (progn;if the current DWGPROPS key is not equal to the current orientation variable
	        			(vla-addcustominfo drawing (strcat "Roof" n "PRS") "NA");add current Salesforce orientation from Excel as the key and the orientation number as the value
			  		(setq pitchbinary2 1);move on to next Salesforce orientation
	      			)
		  );endif	
	      	
		;if this is not the last key
		  (if (= "PRS" (substr tempkeyname4 (- (strlen tempkeyname4) 2)))
	    		(if (= tempkeyname4 (strcat "Roof" n "PRS"));if the current DWGPROPS key is equal to the current orientation variable
	      			(progn;execute
	      				(vla-setcustombykey drawing (strcat "Roof" n "PRS") "NA");delete current DWGPROPS key
			  		(setq pitchbinary2 1);move on to next Salesforce orientation
	      			)
	      			(princ)
	     		);end if
	      	  );end if
	       );end if
	    	(setq keycount4 (+ keycount4 1));next key in DWGPROPS
	    );end while
	  
	);foreach

;--------------------------------------------------------------------------------------------------------------------------------------------------------------;
;----------------------------------------------------------END MAKE ROOF ORIENTATION---------------------------------------------------------------------------;
;--------------------------------------------------------------------------------------------------------------------------------------------------------------;

;--------------------------------------------------------------------------------------------------------------------------------------------------------------;
;----------------------------------------------------------BEGIN MAKE ROOF MODULES-----------------------------------------------------------------------------;
;--------------------------------------------------------------------------------------------------------------------------------------------------------------;
  
  (foreach n numlist
	  (setq keycount5 0
	        modbinary2 0
	  )
	  (while;do until
	    (and;both
	    	(< keycount5 (vla-numcustominfo drawing));go through the whole DWGPROPS until the last key
		(= modbinary2 0);the pitch binary variable is not equal to 0
	    )
	    (vla-getcustombyindex;get current numbered index from DWGPROPS
	      drawing
	      keycount5
	      'tempkeyname5
	      'tempkeyvalue5
	    )
	      (if (= (+ keycount5 1) (vla-numcustominfo drawing));if this is the last key
	    	(if (= "MRS" (substr tempkeyname5 (- (strlen tempkeyname5) 2)))
	    		(if (= tempkeyname5 (strcat "Roof" n "MRS"));if the current DWGPROPS key is equal to the current orientation variable
	      			(progn;execute
	      				(vla-setcustombykey drawing (strcat "Roof" n "MRS") "NA");delete current DWGPROPS key
			  		(setq pitchbinary2 1);move on to next Salesforce orientation
	      			)
	      			(progn;if the current DWGPROPS key is not equal to the current orientation variable
	        			(vla-addcustominfo drawing (strcat "Roof" n "MRS") "NA");add current Salesforce orientation from Excel as the key and the orientation number as the value
			  		(setq modbinary2 1);move on to next Salesforce orientation
	      			)
	     		);end if
		    (progn;if the current DWGPROPS key is not equal to the current orientation variable
	        			(vla-addcustominfo drawing (strcat "Roof" n "MRS") "NA");add current Salesforce orientation from Excel as the key and the orientation number as the value
			  		(setq modbinary2 1);move on to next Salesforce orientation
	      			)
		  );end if
	      	
		;if this is not the last key
		  (if (= "MRS" (substr tempkeyname5 (- (strlen tempkeyname5) 2)))
	    		(if (= tempkeyname5 (strcat "Roof" n "MRS"));if the current DWGPROPS key is equal to the current orientation variable
	      			(progn;execute
	      				(vla-setcustombykey drawing (strcat "Roof" n "MRS") "NA");delete current DWGPROPS key
			  		(setq modbinary2 1);move on to next Salesforce orientation
	      			)
	      			(princ)
	     		);end if
	      	  );end if
	       );end if
	    	(setq keycount5 (+ keycount5 1));next key in DWGPROPS
	    );end while
	  
	);foreach

;--------------------------------------------------------------------------------------------------------------------------------------------------------------;
;----------------------------------------------------------END MAKE ROOF MODULES-------------------------------------------------------------------------------;
;--------------------------------------------------------------------------------------------------------------------------------------------------------------;
;--------------------------------------------------------------------------------------------------------------------------------------------------------------;
;---------------------------------------------------------END REVISION SNAPSHOT--------------------------------------------------------------------------------;
;--------------------------------------------------------------------------------------------------------------------------------------------------------------;
(setq end (getvar "MILLISECS"))
  (princ "\n")
  (princ " makeRoofs time ")
  (princ (itoa (- end start)))
  );defun