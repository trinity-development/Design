;-----------------------------------------------------------------------------------------------------------------------;
;-----------------------------------------------------------------------------------------------------------------------;
;--------------------------GETS ROOF DATA FROM THE "REVISION LIST" SHEET AND--------------------------------------------;
;---------------------------PLACES IT IN DWGPROPS-----------------------------------------------------------------------;
;-----------------------------------------------------------------------------------------------------------------------;
;----------MADE BY TAMIR------------------------------------------------------------------------------------------------;
;-----------------------------------------------------------------------------------------------------------------------;

(load "getCellsFunction")
(vl-load-com)
(defun c:GetSnapRoofs()
  (setq numlist1 '("1" "2" "3" "4" "5")
	arrlist '("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14" "15" "16" "17" "18" "19" "20"
		  "21" "22" "23" "24" "25" "25" "26" "27" "28" "29" "30" "31" "32" "33" "34" "35" "36" "37" "38" "39" "40")
	alphalist '("A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O")
	revlist '("P" "R" "A")
	;|module1 '()
	module2 '()
	module3 '()
	module4 '()
	module5 '()
	orientation1 '()
	orientation2 '()
	orientation3 '()
	
	orientation4 '()
	orientation5 '()
	pitch1 '()
	pitch2 '()
	pitch3 '()
	pitch4 '()
	pitch5 '()|;
	roofArray '()
  )
  (setq	revnum; get last revision number from the FORM page in Excel
    		(getcellsfunction
	 		(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
	 		"FORM"
	 		"C29"
		)
  )
  
  (setq drawing (vla-get-summaryinfo (vla-get-activedocument (vlax-get-acad-object))));MUST HAVE FOR PERFOMING DWGPROPS MANIPULATION
  (foreach n arrlist;got through 1-40
   ; (alert n)
    (setq keycount1 0)
    (setq revtypebinary 0)
  	(while;do until
	   (and;both
	    (< keycount1 (vla-numcustominfo drawing));go through the whole DWGPROPS until the last key
	    (= revtypebinary 0);the revision binary variable is not equal to 0
	   )
	
	  (vla-getcustombyindex;get current numbered index from DWGPROPS
	      drawing
	      keycount1
	      'tempkeyname1
	      'tempkeyvalue1
	    )
	  	
	  	(if (= tempkeyname1 (strcat "Roof" n));if the current key is equal to "Roof" and the current number roof e.g. "Roof" "3"
		  (progn
		    	
		  	(setq roofArray(cons (strcat "Roof" " " n) roofArray));add the current roof number to the roofArray list
		    	
		    	(setq keycount1 0)
		    	(setq revtypebinary 1)
		  )
		  ;if not
		  (setq keycount1 (+ keycount1 1)); go to the next key
		)
	  )
    	
    )
  
  (setq revalphalist '(
		        ("A" "B" "C" "D"); P1
		       	("E" "F" "G" "H"); P2
		       	("I" "J" "K" "L"); P3
		       	("M" "N" "O" "P"); P4
		       	("Q" "R" "S" "T"); P5
		       	("U" "V" "W" "X"); R1
		       	("Y" "Z" "AA" "AB"); R2
		       	("AC" "AD" "AE" "AF"); R3
		       	("AG" "AH" "AI" "AJ"); R4
		       	("AK" "AL" "AM" "AN"); R5
		       	("AO" "AP" "AQ" "AR"); A1
		       	("AS" "AT" "AU" "AV"); A2
		       	("AW" "AX" "AY" "AZ"); A3
		       	("BA" "BB" "BC" "BD"); A4
		       	("BE" "BF" "BG" "BH"); A5
		       			 )
  )
	;------------------------------------------------------------------------------------------------------------------------------------------------------;
	;------------------------------------------------------------------------------------------------------------------------------------------------------;
	;--------------------------------------------------GET MODULE LAST REVISION START----------------------------------------------------------------------;
	;------------------------------------------------------------------------------------------------------------------------------------------------------;
	;------------------------------------------------------------------------------------------------------------------------------------------------------;
  	(foreach n numlist1;go through 1-5
	  (foreach k revlist;go through P, R, A
	    (if (= revnum (strcat k n));if revision number from Excel is equal to current guessed revision number
	      
		(progn
		(cond
		  ((= k "P")
		  	(setq count 0));if it's a permit set, count is 0
		  ((= k "R")
		  	(setq count 5));if it's a revison, count is 5
		  ((= k "A")
		  	(setq count 10));if it's an as built, count is 10
		  (t )
		)
		  (setq currRev (nth (+ (- (atoi n) 1) count) revalphalist));get the nth element in the revision list array
		  (setq revname1 "MRS");suffex name is "MRS"
			
		

				 (setq drawing (vla-get-summaryinfo (vla-get-activedocument (vlax-get-acad-object))));MUST HAVE FOR PERFOMING DWGPROPS MANIPULATION
  ;(setq revnumlist '("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14" "15" "16" "17" "18"))
  
    (setq revnumlist '("3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14" "15" "16" "17" "18" "19" "20"
		  "21" "22" "23" "24" "25" "26" "27" "28" "29" "30" "31" "32" "33" "34" "35" "36" "37" "38" "39" "40" "41" "42" "43"))
  (setq revtypecount 0)
    
	(foreach k roofArray;go through each roofnumber in the array we made earlier
	 
	  ;(if (= k tempkeyname)
	   (progn
	    (setq excelkey 3)
	   (setq excelbinary 0
		 nextk 0
	   )
	    
	   (while;do until
	    
	    (and
	     (= excelbinary 0)
	     (/= excelkey 50)
	    )
	     
	    
	      
	      (if(= k (getcellsfunction;if the current roof name is equal to the current Roofnumber in Excel
		  		(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 		"REVISION LIST"
				(strcat (car currRev) (itoa excelkey));orientation number on that roof
		      ))
		  	;(setq excelbinary 1)
			
			(progn
			  ;(ALERT k)
			  	(setq module (getcellsfunction;get module number for last revision sent to township
		  				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 				"REVISION LIST"
						(strcat (cadr currRev) (itoa excelkey))
		      			     )
				      pitch (getcellsfunction;get pitch number for last revision sent to township
		  					(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 					"REVISION LIST"
							(strcat (caddr currRev) (itoa excelkey))
		      			    )
				      orientation (getcellsfunction;get orientation number for last revision sent to township
		  					(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 					"REVISION LIST"
							(strcat (caddr(cdr currRev)) (itoa excelkey))
		      			    	  )
				      
				 )
			  (setq excelbinary 1)
			  )
		;if not, check the next roofnumber in Excel
		(progn
			
		  	(if (= excelkey 50)
			  (progn
			    (setq nextk 1)
			    
			  )
			)
		  	
		)
	      )
	     (setq excelkey (+ excelkey 1))
	    )
	    (setq arrcheck 0)
	    (setq keycount2 0
	          revtypebinary1 0
		  k (vl-string-subst "" " " k)
	    )
	    (while
	      (and;both
	    (< keycount2 (vla-numcustominfo drawing));go through the whole DWGPROPS until the last key
	    (= revtypebinary1 0);the revision binary variable is not equal to 0
	   )
	    (vla-getcustombyindex;get current numbered index from DWGPROPS
	      drawing
	      keycount2
	      'tempkeyname2
	      'tempkeyvalue2
	    )
	    	;(setq rfblk (ssget "x" (list (cons 0 "insert")(cons 2 k))))
	     (if  (= nextk 0) 
	      (if (= (+ keycount2 1) (vla-numcustominfo drawing));if this is the last key
	    	(if (= revname1 (substr tempkeyname2 (- (strlen tempkeyname2) 2)));if the current key has the "MRS" suffex
	    		(if (= tempkeyname2 (strcat k revname1));if the current DWGPROPS key is equal to the current module revision snapshot variable
	      			(progn;execute
	      				(vla-removecustombykey drawing tempkeyname2);delete current DWGPROPS key
				  	(cond
					  ((= revname1 "MRS"); if it's a module suffex
  						
						    (vla-addcustominfo drawing;add current module revision snapshot from Excel as the key and the module number as the value
	  						(strcat k revname1)
								module;module revision snapshot
						 	)
						 )
						 
					  ((= revname1 "PRS"); if it's a pitch suffex
					  	
						 	(vla-addcustominfo drawing;add current pitch revision snapshot from Excel as the key and the pitch number as the value
	  						(strcat k revname1)
								pitch ;pitch revision snapshot
				 			)
						 )
					  ((= revname1 "ORS"); if it's an orientation suffex
					  	
						 	(vla-addcustominfo drawing;add current orientation revision snapshot from Excel as the key and the orientation number as the value
	  						(strcat k revname1)
								orientation;orientation revision snapshot
				 			)
						 )
					)
				  	
			  		(setq revtypebinary1 1);move on to next Roofnumber
				  )
	      			
	      			(progn;execute
	      				(vla-removecustombykey drawing tempkeyname2)
				  	(cond
					  ((= revname1 "MRS"); if it's a module suffex
  						
						    (vla-addcustominfo drawing;add current module revision snapshot from Excel as the key and the module number as the value
	  						(strcat k revname1)
								module;module revision snapshot
						 	)
						 )
						 
					  ((= revname1 "PRS"); if it's a pitch suffex
					  	
						 	(vla-addcustominfo drawing;add current pitch revision snapshot from Excel as the key and the pitch number as the value
	  						(strcat k revname1)
								pitch ;pitch revision snapshot
				 			)
						 )
					  ((= revname1 "ORS"); if it's an orientation suffex
					  	
						 	(vla-addcustominfo drawing;add current orientation revision snapshot from Excel as the key and the orientation number as the value
	  						(strcat k revname1)
								orientation;orientation revision snapshot
				 			)
						 )
					)
				  
			  		(setq revtypebinary1 1);move on to next Salesforce orientation
				  )
	     		);end if
		  (progn;execute
	 
				  
			 (setq revtypebinary1 1);move on to next Roofnumber
		)
	      	);end if
		;if this is not the last key
		(if (= revname1 (substr tempkeyname2 (- (strlen tempkeyname2) 2)));if the current key is a Salesforce orientation
		  
	    		(if (= tempkeyname2 (strcat k revname1));if the current DWGPROPS key is equal to the current orientation variable
			  
	      			(progn;execute
	      				(vla-removecustombykey drawing tempkeyname2);delete current DWGPROPS key
				  	(cond
					  ((= revname1 "MRS"); if it's a module suffex
  						
						    (vla-addcustominfo drawing;add current module revision snapshot from Excel as the key and the module number as the value
	  						(strcat k revname1)
								module;module revision snapshot
						 	)
						 )
						 
					  ((= revname1 "PRS"); if it's a pitch suffex
					  	
						 	(vla-addcustominfo drawing;add current pitch revision snapshot from Excel as the key and the pitch number as the value
	  						(strcat k revname1)
								pitch ;pitch revision snapshot
				 			)
						 )
					  ((= revname1 "ORS"); if it's an orientation suffex
					  	
						 	(vla-addcustominfo drawing;add current orientation revision snapshot from Excel as the key and the orientation number as the value
	  						(strcat k revname1)
								orientation;orientation revision snapshot
				 			)
						 )
					)
				  
			  		(setq revtypebinary1 1);move on to next Roof number
				  )
	      			
	     		);end if
	      	);end if
	       );end if
	       (setq arrcheck 1)
	    ) ;endif
	      
	    	(setq keycount2 (+ keycount2 1));next key in DWGPROPS
	    );end while
	    (setq revtypebinary1 1)
	   );progn
	   
	);end for each
       );endforeach
       
      );progn
  ;)
)
		  )
	;------------------------------------------------------------------------------------------------------------------------------------------------------;
	;------------------------------------------------------------------------------------------------------------------------------------------------------;
	;--------------------------------------------------GET MODULE LAST REVISION END------------------------------------------------------------------------;
	;------------------------------------------------------------------------------------------------------------------------------------------------------;
	;------------------------------------------------------------------------------------------------------------------------------------------------------;

  	;------------------------------------------------------------------------------------------------------------------------------------------------------;
	;------------------------------------------------------------------------------------------------------------------------------------------------------;
	;--------------------------------------------------GET PITCH LAST REVISION START-----------------------------------------------------------------------;
	;------------------------------------------------------------------------------------------------------------------------------------------------------;
	;------------------------------------------------------------------------------------------------------------------------------------------------------;
(setq revnumlist '("3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14" "15" "16" "17" "18" "19" "20"
		  "21" "22" "23"))
  (setq revtypecount1 0)
  (foreach n numlist1
	  (foreach k revlist
	    (if (= revnum (strcat k n))
	      
		(progn
		(cond
		  ((= k "P")
		  	(setq count 0))
		  ((= k "R")
		  	(setq count 5))
		  ((= k "A")
		  	(setq count 10))
		  (t)
		)
		(setq currRev (nth (+ (- (atoi n) 1) count) revalphalist))
		(SETQ revname2 "PRS")
			
	(foreach k roofArray
	  
	  ;(if (= k tempkeyname)
	   (progn
	    (setq excelkey1 3)
	   (setq excelbinary1 0
		 nextk2 0
	   )
	    
	   (while;do until
	    
	     
	     (and
	     (= excelbinary1 0)
	     (/= excelkey1 50)
	    )
	    
	     
	    
	     
	      
	      (if(= k (getcellsfunction
		  		(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 		"REVISION LIST"
				(strcat (car currRev) (itoa excelkey1));orientation number on that roof
		      ))
		  	;(setq excelbinary 1)
			
			(progn
			  
			  	(setq module (getcellsfunction
		  				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 				"REVISION LIST"
						(strcat (cadr currRev) (itoa excelkey1));orientation number on that roof
		      			     )
				      pitch (getcellsfunction
		  					(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 					"REVISION LIST"
							(strcat (caddr currRev) (itoa excelkey1));orientation number on that roof
		      			    )
				      orientation (getcellsfunction
		  					(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 					"REVISION LIST"
							(strcat (caddr(cdr currRev)) (itoa excelkey1));orientation number on that roof
		      			    	  )
				      
				 )
			  (setq excelbinary1 1)
			  )
		(progn
			(setq excelkey1 (+ excelkey1 1))
		  	(if (= excelkey1 50)
			  (progn
			    (setq nextk2 1)
			    
			    
			  )
			)
		  	
		)
	      )
	     
	    )
	    (setq keycount3 0
	          revtypebinary3 0
		  arrcheck 0
		  k (vl-string-subst "" " " k)
	    )
	    (while
	      (and;both
	    (< keycount3 (vla-numcustominfo drawing));go through the whole DWGPROPS until the last key
	    (= revtypebinary3 0);the pitch binary variable is not equal to 0
	   )
	    (vla-getcustombyindex;get current numbered index from DWGPROPS
	      drawing
	      keycount3
	      'tempkeyname3
	      'tempkeyvalue3
	    )
	    	
	     (if (or (= nextk2 0)(setq rfblk (ssget "x" (list (cons 0 "insert")(cons 2 k)))))
	      (if (= (+ keycount3 1) (vla-numcustominfo drawing));if this is the last key
	    	(if (= revname2 (substr tempkeyname3 (- (strlen tempkeyname3) 2)));if the current key is a Salesforce orientation
	    		(if (= tempkeyname3 (strcat k revname2));if the current DWGPROPS key is equal to the current orientation variable
	      			(progn;execute
	      				(vla-removecustombykey drawing tempkeyname3);delete current DWGPROPS key
				  	(cond
					  ((= revname2 "MRS")
  						
						    (vla-addcustominfo drawing;add current Salesforce orientation from Excel as the key and the orientation number as the value
	  						(strcat k revname2);Salesforce orientation number
								module
						 	)
						 )
						 
					  ((= revname2 "PRS")
					  	
						 	(vla-addcustominfo drawing;add current Salesforce orientation from Excel as the key and the orientation number as the value
	  						(strcat k revname2);Salesforce orientation number
								pitch 
				 			)
						 )
					  ((= revname2 "ORS")
					  	
						 	(vla-addcustominfo drawing;add current Salesforce orientation from Excel as the key and the orientation number as the value
	  						(strcat k revname2);Salesforce orientation number
								orientation
				 			)
						 )
					)
				  	
			  		(setq revtypebinary3 1);move on to next Salesforce orientation
				  )
	      			
	      			(progn;execute
	      				(vla-removecustombykey drawing tempkeyname3)
				  	(cond
					  ((= revname2 "MRS")
  						
						    (vla-addcustominfo drawing;add current Salesforce orientation from Excel as the key and the orientation number as the value
	  						(strcat k revname2);Salesforce orientation number
								module
						 	)
						 )
						 
					  ((= revname2 "PRS")
					  	
						 	(vla-addcustominfo drawing;add current Salesforce orientation from Excel as the key and the orientation number as the value
	  						(strcat k revname2);Salesforce orientation number
								pitch
				 			)
						 )
					  ((= revname2 "ORS")
					  	
						 	(vla-addcustominfo drawing;add current Salesforce orientation from Excel as the key and the orientation number as the value
	  						(strcat k revname2);Salesforce orientation number
								orientation
				 			)
						 )
					)
				  
			  		(setq revtypebinary3 1);move on to next Salesforce orientation
				  )
	     		);end if
		  (progn;execute
	 
				  
			 (setq revtypebinary3 1);move on to next Salesforce orientation
		)
	      	);end if
		;if this is not the last key
		(if (= revname2 (substr tempkeyname3 (- (strlen tempkeyname3) 2)));if the current key is a Salesforce orientation
		  
	    		(if (= tempkeyname3 (strcat k revname2));if the current DWGPROPS key is equal to the current orientation variable
			  
	      			(progn;execute
	      				
				  	(cond
					  ((= revname2 "MRS")
  						(vla-removecustombykey drawing tempkeyname3);delete current DWGPROPS key	
						    (vla-addcustominfo drawing;add current Salesforce orientation from Excel as the key and the orientation number as the value
	  						(strcat k revname2);Salesforce orientation number
								module
						 	)
						 )
						 
					  ((= revname2 "PRS")
					  	(vla-removecustombykey drawing tempkeyname3);delete current DWGPROPS key
						 	(vla-addcustominfo drawing;add current Salesforce orientation from Excel as the key and the orientation number as the value
	  						(strcat k revname2);Salesforce orientation number
								pitch
				 			)
						 )
					  ((= revname2 "ORS")
					  	(vla-removecustombykey drawing tempkeyname3);delete current DWGPROPS key
						 	(vla-addcustominfo drawing;add current Salesforce orientation from Excel as the key and the orientation number as the value
	  						(strcat k revname2);Salesforce orientation number
								orientation
				 			)
						 )
					)
				  
			  		(setq revtypebinary3 1);move on to next Salesforce orientation
				  )
	      			
	     		);end if
	      	);end if
	       );end if
	       (setq arrcheck 1)
	     );end if
	      
	    	(setq keycount3 (+ keycount3 1));next key in DWGPROPS
	    );end while
	    (setq revtypebinary3 1)
	   );progn
	   
	)
			
		)
	      
	    )
	  )
	)
	;------------------------------------------------------------------------------------------------------------------------------------------------------;
	;------------------------------------------------------------------------------------------------------------------------------------------------------;
	;--------------------------------------------------GET PITCH LAST REVISION END-------------------------------------------------------------------------;
	;------------------------------------------------------------------------------------------------------------------------------------------------------;
	;------------------------------------------------------------------------------------------------------------------------------------------------------;
  
  	;------------------------------------------------------------------------------------------------------------------------------------------------------;
	;------------------------------------------------------------------------------------------------------------------------------------------------------;
	;--------------------------------------------------GET ORIENTATION LAST REVISION START-----------------------------------------------------------------;
	;------------------------------------------------------------------------------------------------------------------------------------------------------;
	;------------------------------------------------------------------------------------------------------------------------------------------------------;
  (setq revnumlist '("3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14" "15" "16" "17" "18" "19" "20"
		  "21" "22" "23"))
  (setq revtypecount1 0)
  	(foreach n numlist1
	  (foreach k revlist
	    (if (= revnum (strcat k n))
	      
		(progn
		(cond
		  ((= k "P")
		  	(setq count 0))
		  ((= k "R")
		  	(setq count 5))
		  ((= k "A")
		  	(setq count 10))
		  (t)
		)
		(setq currRev (nth (+ (- (atoi n) 1) count) revalphalist))
		(SETQ revname3 "ORS")
			
(foreach k roofArray
	  
	  ;(if (= k tempkeyname)
	   (progn
	    (setq excelkey2 3)
	   (setq excelbinary2 0
		 nextk3 0
	   )
	    
	   (while;do until
	    
	     
	     (and
	     (= excelbinary2 0)
	     (/= excelkey2 50)
	    )
	    
	     
	   
	     
	      
	      (if(= k (getcellsfunction
		  		(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 		"REVISION LIST"
				(strcat (car currRev) (itoa excelkey2));orientation number on that roof
		      ))
		  	;(setq excelbinary 1)
			
			(progn
			  
			  	(setq module (getcellsfunction
		  				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 				"REVISION LIST"
						(strcat (cadr currRev) (itoa excelkey2));orientation number on that roof
		      			     )
				      pitch (getcellsfunction
		  					(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 					"REVISION LIST"
							(strcat (caddr currRev) (itoa excelkey2));orientation number on that roof
		      			    )
				      orientation (getcellsfunction
		  					(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 					"REVISION LIST"
							(strcat (caddr(cdr currRev)) (itoa excelkey2));orientation number on that roof
		      			    	  )
				      
				 )
			  (setq excelbinary2 1)
			  
			  )
			
		(progn
			(setq excelkey2 (+ excelkey2 1))
		  	(if (= excelkey2 50)
			  (progn
			    
			    (setq nextk3 1)
			  )
			)
		  	
		)
	      )
	     
	    )
	    (setq keycount4 0
	          revtypebinary4 0
		  k (vl-string-subst "" " " k)
	    )
	    (while
	      (and;both
	    (< keycount4 (vla-numcustominfo drawing));go through the whole DWGPROPS until the last key
	    (= revtypebinary4 0);the pitch binary variable is not equal to 0
	   )
	    (vla-getcustombyindex;get current numbered index from DWGPROPS
	      drawing
	      keycount4
	      'tempkeyname4
	      'tempkeyvalue4
	    )
	    	
	     (if (or (= nextk3 0)(setq rfblk (ssget "x" (list (cons 0 "insert")(cons 2 k)))))
	      (if (= (+ keycount4 1) (vla-numcustominfo drawing));if this is the last key
	    	(if (= revname3 (substr tempkeyname4 (- (strlen tempkeyname4) 2)));if the current key is a Salesforce orientation
	    		(if (= tempkeyname2 (strcat k revname3));if the current DWGPROPS key is equal to the current orientation variable
	      			(progn;execute
	      				(vla-removecustombykey drawing tempkeyname4);delete current DWGPROPS key
				  	(cond
					  ((= revname3 "MRS")
  						
						    (vla-addcustominfo drawing;add current Salesforce orientation from Excel as the key and the orientation number as the value
	  						(strcat k revname3);Salesforce orientation number
								module
						 	)
						 )
						 
					  ((= revname3 "PRS")
					  	
						 	(vla-addcustominfo drawing;add current Salesforce orientation from Excel as the key and the orientation number as the value
	  						(strcat k revname3);Salesforce orientation number
								pitch 
				 			)
						 )
					  ((= revname3 "ORS")
					  	
						 	(vla-addcustominfo drawing;add current Salesforce orientation from Excel as the key and the orientation number as the value
	  						(strcat k revname3);Salesforce orientation number
								orientation
				 			)
						 )
					)
				  	
			  		(setq revtypebinary4 1);move on to next Salesforce orientation
				  )
	      			
	      			(progn;execute
	      				(vla-removecustombykey drawing tempkeyname4)
				  	(cond
					  ((= revname3 "MRS")
  						
						    (vla-addcustominfo drawing;add current Salesforce orientation from Excel as the key and the orientation number as the value
	  						(strcat k revname3);Salesforce orientation number
								module
						 	)
						 )
						 
					  ((= revname3 "PRS")
					  	
						 	(vla-addcustominfo drawing;add current Salesforce orientation from Excel as the key and the orientation number as the value
	  						(strcat k revname3);Salesforce orientation number
								pitch
				 			)
						 )
					  ((= revname3 "ORS")
					  	
						 	(vla-addcustominfo drawing;add current Salesforce orientation from Excel as the key and the orientation number as the value
	  						(strcat k revname3);Salesforce orientation number
								orientation
				 			)
						 )
					)
				  
			  		(setq revtypebinary4 1);move on to next Salesforce orientation
				  )
	     		);end if
		  (progn;execute
	 
				  
			 (setq revtypebinary4 1);move on to next Salesforce orientation
		)
	      	);end if
		;if this is not the last key
		(if (= revname3 (substr tempkeyname4 (- (strlen tempkeyname4) 2)));if the current key is a Salesforce orientation
		  
	    		(if (= tempkeyname4 (strcat k revname3));if the current DWGPROPS key is equal to the current orientation variable
			  
	      			(progn;execute
	      				
				  	(cond
					  ((= revname3 "MRS")
  						(vla-removecustombykey drawing tempkeyname4);delete current DWGPROPS key	
						    (vla-addcustominfo drawing;add current Salesforce orientation from Excel as the key and the orientation number as the value
	  						(strcat k revname3);Salesforce orientation number
								module
						 	)
						 )
						 
					  ((= revname3 "PRS")
					  	(vla-removecustombykey drawing tempkeyname4);delete current DWGPROPS key
						 	(vla-addcustominfo drawing;add current Salesforce orientation from Excel as the key and the orientation number as the value
	  						(strcat k revname3);Salesforce orientation number
								pitch
				 			)
						 )
					  ((= revname3 "ORS")
					  	(vla-removecustombykey drawing tempkeyname4);delete current DWGPROPS key
						 	(vla-addcustominfo drawing;add current Salesforce orientation from Excel as the key and the orientation number as the value
	  						(strcat k revname3);Salesforce orientation number
								orientation
				 			)
						 )
					)
				  
			  		(setq revtypebinary4 1);move on to next Salesforce orientation
				  )
	      			
	     		);end if
	      	);end if
	       );end if
	       
	     ); end if
	      
	    	(setq keycount4 (+ keycount4 1));next key in DWGPROPS
	    );end while
	    (setq revtypebinary4 1)
	   );progn
	   
	);END FOREACH
			
		)
	      
	    )
	  )
	)
	;------------------------------------------------------------------------------------------------------------------------------------------------------;
	;------------------------------------------------------------------------------------------------------------------------------------------------------;
	;--------------------------------------------------GET PITCH LAST REVISION END-------------------------------------------------------------------------;
	;------------------------------------------------------------------------------------------------------------------------------------------------------;
	;------------------------------------------------------------------------------------------------------------------------------------------------------;
  );defun






