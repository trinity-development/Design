;-----------------------------------------------------------------------------;
;-----------------------------------------------------------------------------;
;------------COUNTS ALL ROOF MODULES, ROOF PITCHES AND ROOF-------------------;
;------------ORIENTATIONS AND COMPARES THE SYSYTEM BUILDER--------------------;
;------------ROOF TO THE LAYOUT ROOF------------------------------------------;
;-----------------------------------------------------------------------------;
;-----MADE BY TAMIR LIEBER----------------------------------------------------;
;-----------------------------------------------------------------------------;

(defun c:modcount(/ blo doc js lst n tbl)
  (vl-load-com)
  (setq doc (vla-get-activedocument (vlax-get-acad-object)))
  (vlax-for blo (vla-get-blocks doc)
    (or (wcmatch (vla-get-name blo) "`**,*|*")
	(eq (vla-get-isxref blo) :vlax-true)
      (progn
	(setq lst nil)
	(vlax-for ent blo
	  (setq tbl (cons (vla-get-objectname ent) tbl))
	)
 	(while tbl	
	  (setq n   (length tbl)
		js  (car tbl)
		tbl (vl-remove js tbl)
		lst (cons (cons (itoa (- n (length tbl))) js) lst)
	  )
	);make a list of all the blocks in the drawing
	
	(if;check if any of the blocks are a Roof#
	  (or
	    (= (vla-get-name blo) "Roof1")
	    (= (vla-get-name blo) "Roof2")
	    (= (vla-get-name blo) "Roof3")
	    (= (vla-get-name blo) "Roof4")
	    (= (vla-get-name blo) "Roof5")
	    (= (vla-get-name blo) "Roof6")
	    (= (vla-get-name blo) "Roof7")
	    (= (vla-get-name blo) "Roof8")
	    (= (vla-get-name blo) "Roof9")
	    (= (vla-get-name blo) "Roof10")
	    (= (vla-get-name blo) "Roof11")
	    (= (vla-get-name blo) "Roof12")
	    (= (vla-get-name blo) "Roof13")
	    (= (vla-get-name blo) "Roof14")
	    (= (vla-get-name blo) "Roof15")
	    (= (vla-get-name blo) "Roof16")
	    (= (vla-get-name blo) "Roof17")
	    (= (vla-get-name blo) "Roof18")
	    (= (vla-get-name blo) "Roof19")
	    (= (vla-get-name blo) "Roof20")
	    (= (vla-get-name blo) "Roof21")
	    (= (vla-get-name blo) "Roof22")
	    (= (vla-get-name blo) "Roof23")
	    (= (vla-get-name blo) "Roof24")
	    (= (vla-get-name blo) "Roof25")
	    (= (vla-get-name blo) "Roof26")
	    (= (vla-get-name blo) "Roof27")
	    (= (vla-get-name blo) "Roof28")
	    (= (vla-get-name blo) "Roof29")
	    (= (vla-get-name blo) "Roof30")
	    (= (vla-get-name blo) "Roof31")
	    (= (vla-get-name blo) "Roof32")
	    (= (vla-get-name blo) "Roof33")
	    (= (vla-get-name blo) "Roof34")
	    (= (vla-get-name blo) "Roof35")
	    (= (vla-get-name blo) "Roof36")
	    (= (vla-get-name blo) "Roof37")
	    (= (vla-get-name blo) "Roof38")
	    (= (vla-get-name blo) "Roof39")
	    (= (vla-get-name blo) "Roof40")
	  )
	  
	  (progn
	    (if (ssget "x" (list (cons 0 "insert")(cons 2 (vla-get-name blo))))
	      (progn
	    	(setq drawing (vla-get-summaryinfo (vla-get-activedocument (vlax-get-acad-object))));MUST HAVE FOR PERFOMING DWGPROPS MANIPULATION

		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;check orientation;;;;;;;;;;;;;;;;;;; 
	    	
	    	(setq   keyname3 (strcat (vla-get-name blo) "OS");RSA roof name and "S"
			keycount3 0
			keyvalue3 nil
			orientationbinary 0
		)
		  (while;this checks whether the RSA roof name is in dwgprops or not and either adds it or if it already is in there, removes it and adds a new version if it is
			(and	
		      		(< keycount3 (vla-numcustominfo drawing));go through the whole DWGPROPS until the last key
		      		(= orientationbinary 0);the orientation binary variable is not equal to 0
		    	)
		      		(vla-getcustombyindex;get current numbered index from DWGPROPS
		      		drawing
		      		keycount3
		      		'tempkeyname3
		      		'tempkeyvalue3
		      		)

		    		(if (= (+ keycount3 1) (vla-numcustominfo drawing));if this is the last key
		    			(if (= "OS" (substr tempkeyname3 (- (strlen tempkeyname3) 1)));if the current key is a Salesforce orientation
						(if (= tempkeyname3 (strcat (vla-get-name blo) "OS"));if the current DWGPROPS key is equal to the current orientation variable
							(progn;execute
								(vla-getcustombykey drawing (strcat (vla-get-name blo) "OS") 'orientationS);get orientation number of Salesforce roof in DWGPROPS
		      						(vla-getcustombykey drawing (strcat (vla-get-name blo) "O") 'orientation);get orientation number of RSA Roof in DWGPROPS
		      						(if (= (atoi orientation) (atoi orientationS));if orientation number on Salesforce roof is the same as number of modules on RSA roof
					  				(progn;execute
			 							(princ (strcat " ((" (vla-get-name blo) " has correct orientation)) "))
							  			(setq orientationbinary 1);end the while loop
									)
						  			;if orientation number on Salesforce roof is not the same as orientation number on RSA roof
					  				(progn;execute
								    		(alert (strcat (vla-get-name blo) " orientation is incorrect."));create a pop-up saying orientation is incorrect
							  			(setq orientationbinary 1);end the while loop
									)
		    						);end if
							)
							;if the current DWGPROPS key is not equal to the current Roof variable
							(progn
					    			(alert (strcat "Missing System Builder " (vla-get-name blo) " orientation\n" "or Layout " (vla-get-name blo) " orientation needs to be removed."));create a popup saying that a Salesforce roof is missing
					    			(princ)
					  			(setq orientationbinary 1);end the while loop
							)
						);end if
			  			;if the current key is not a Salesforce orientation
			  			(progn
		    					(alert (strcat "Missing System Builder " (vla-get-name blo) " orientation\n" "or Layout " (vla-get-name blo) " orientation needs to be removed."));create a popup saying that a Salesforce orientation is missing
			    				(princ )
							(setq orientationbinary 1);end the while loop
			  			)
		  			);end if
		    			;if this is not the last key
		    			(if (= "OS" (substr tempkeyname3 (- (strlen tempkeyname3) 1)));if the current key is a Salesforce orientation
						(if (= tempkeyname3 (strcat (vla-get-name blo) "OS"));if the current DWGPROPS key is equal to the current orientation variable
		      					(progn
								(vla-getcustombykey drawing (strcat (vla-get-name blo) "OS") 'orientationS);get orientation number of Salesforce roof in DWGPROPS
		      						(vla-getcustombykey drawing (strcat (vla-get-name blo) "O") 'orientation);get orientation of RSA Roof in DWGPROPS
		      						(if (= (atoi orientation) (atoi orientationS));if orientation numbers on Salesforce roof is the same as orientation number on RSA roof
				  					(progn;execute
			 							(princ (strcat " (("(vla-get-name blo) " has correct orientation)) "))
							  			(setq orientationbinary 1);end the while loop
									)
						  			;if orientation number on Salesforce roof is not the same as number of modules on RSA roof
					  				(progn;execute
										(alert (strcat (vla-get-name blo) " orientation is incorrect."));create a pop-up saying orientation is incorrect
							  			(setq orientationbinary 1);end the while loop
									)
		    						);end if
							)
						);end if
		      				(princ)
		    			);end if
				);end if
			(setq keycount3 (1+ keycount3));move on to the next key in DWGPROPS
		);end while

		;;;;;;;;;;;;;;;end check orientation;;;;;;;;;;;;;
		
		;;;;;;;;;;;;;;;;check roof pitch;;;;;;;;;;;;;;;

		(setq   keyname2 (strcat (vla-get-name blo) "PS");RSA roof name and "PS"
			keycount2 0
			keyvalue2 nil
			pitchbinary 0
		)
		  (while;this checks whether the RSA pitch name is in dwgprops or not and either adds it or if it already is in there, removes it and adds a new version if it is
			(and	
		      		(< keycount2 (vla-numcustominfo drawing));go through the whole DWGPROPS until the last key
		      		(= pitchbinary 0);the pitch binary variable is not equal to 0
		    	)
		      		(vla-getcustombyindex;get current numbered index from DWGPROPS
		      		drawing
		      		keycount2
		      		'tempkeyname2
		      		'tempkeyvalue2
		      		)
		    
				(if (= (+ keycount2 1) (vla-numcustominfo drawing));if this is the last key
		    			(if (= "PS" (substr tempkeyname2 (- (strlen tempkeyname2) 1)));if the current key is a Salesforce pitch
						(if (= tempkeyname2 (strcat (vla-get-name blo) "PS"));if the current DWGPROPS key is equal to the current pitch variable
					     		(progn;execute
								(vla-getcustombykey drawing (strcat (vla-get-name blo) "PS") 'pitchS);get pitch number of Salesforce roof in DWGPROPS
		      						(vla-getcustombykey drawing (strcat (vla-get-name blo) "P") 'pitch);get pitch number of RSA Roof in DWGPROPS
		      						(if (= (atoi pitch) (atoi pitchS));if pitch number on Salesforce roof is the same as pitch number on RSA roof
					  				(progn;execute
			 							(princ (strcat " ((" (vla-get-name blo) " has correct pitch)) "))
							  			(setq pitchbinary 1);end the while loop
									)
						  			;if pitch number on Salesforce roof is not the same as pitch number on RSA roof
					  				(progn;execute
								    		(alert (strcat (vla-get-name blo) " pitch is incorrect."));create a pop-up saying pitch is incorrect
							  			(setq pitchbinary 1);end the while loop
									)
		    						);end if
				      	     		)
					  		;if the current DWGPROPS key is not equal to the current pitch variable
					  		(progn
					    			(alert (strcat "Missing System Builder " (vla-get-name blo) " pitch\n" "or Layout " (vla-get-name blo) " pitch needs to be removed."));create a popup saying that a Salesforce pitch is missing
					    			(princ)
					  			(setq pitchbinary 1);end the while loop
					  		)
				       		);end if
			  			;if the current key is not a Salesforce pitch
			  			(progn
		    					(alert (strcat "Missing System Builder " (vla-get-name blo) " pitch\n" "or Layout " (vla-get-name blo) " pitch needs to be removed."));create a popup saying that a Salesforce pitch is missing
			    				(princ)
							(setq pitchbinary 1);end the while loop
			  			)
		  			);end if
					;if this is not the last key
		    			(if (= "PS" (substr tempkeyname2 (- (strlen tempkeyname2) 1)));if the current key is a Salesforce pitch
						(if (= tempkeyname2 (strcat (vla-get-name blo) "PS"));if the current DWGPROPS key is equal to the current pitch variable
		      					(progn
								(vla-getcustombykey drawing (strcat (vla-get-name blo) "PS") 'pitchS);get pitch number of Salesforce roof in DWGPROPS
		      						(vla-getcustombykey drawing (strcat (vla-get-name blo) "P") 'pitch);get pitch number of RSA Roof in DWGPROPS
		      						(if (= (atoi pitch) (atoi pitchS));if pitch number on Salesforce roof is the same as pitch number on RSA roof
				  					(progn;execute
			 							(princ (strcat " (("(vla-get-name blo) " has correct pitch)) "))
							  			(setq pitchbinary 1);end the while loop
									)
						  			;if pitch number on Salesforce roof is not the same as pitch number on RSA roof
					  				(progn;execute
								    		(alert (strcat (vla-get-name blo) " pitch is incorrect."));create a pop-up saying pitch is incorrect
							  			(setq pitchbinary 1);end the while loop
									)
		    						);end if
							)
						);end if
		      				(princ)
		    			);end if
		  		);end if
		  	(setq keycount2 (1+ keycount2));move on to the next key in DWGPROPS
		 );end while
		|;
		;;;;;;;;;;;;;;;;;end check roof pitch;;;;;;;;;;;;;;;;;;;;

		;;;;;;;;;;;;;;make RSA roof variables in DWGPROPS;;;;;;;;;;;;;;;;
		(princ (strcat " " "((" (vla-get-name blo) " contains " ;add all the things inside here together
				(foreach n (vl-sort lst '(lambda (a b) (< (cdr a) (cdr b))));gets the amount of modules in the current block
	  	 			(strcat;add all the things inside here together
			 			
			 			(car n);number of modules
			 			" modules, "
		 			)
	  			);end foreach
			);end strcat
		       
		);end princ
		(setq   keyname (vla-get-name blo);current RSA roof block
			keycount 0
			keyvalue nil
		)
	    	
	    	(foreach n (vl-sort lst '(lambda (a b) (< (cdr a) (cdr b))))
		  
		  (while;this checks whether the RSA roof name is in dwgprops or not and either adds it or if it already is in there, removes it and adds a new version if it is
		    
		      (< keycount (vla-numcustominfo drawing));go through the whole DWGPROPS until the last key
		    
		      (vla-getcustombyindex;get current numbered index from DWGPROPS
		      	drawing
		      	keycount
		      	'tempkeyname
		      	'tempkeyvalue
		      )
		    
		  (if
		 
		     (= (+ keycount 1) (vla-numcustominfo drawing));if this is the last key
			
		    
		    	(if
		    		(= tempkeyname keyname);if the current DWGPROPS key has the same name as the current RSA roof block
		    			(progn;execute
	  					(vla-removecustombykey drawing (vla-get-name blo));remove DWGPROPS key with current RSA roof name
			  			(vla-addcustominfo drawing (vla-get-name blo) (car n));add DWGPROPS key with current RSA roof name and the number of modules on that roof
					)
			  		;if the current DWGPROPS key has a different name as the current RSA roof block
		    			(vla-addcustominfo drawing (vla-get-name blo) (car n));add DWGPROPS key with current RSA roof name and the number of modules on that roof
		  	);end if
		    (if;if this isn't the last key
		      	(= tempkeyname keyname);if the current DWGPROPS key has the same name as the current RSA roof block
		      	(progn;exeggutor
	  				(vla-removecustombykey drawing (vla-get-name blo));remove DWGPROPS key with current RSA roof name
			  		(vla-addcustominfo drawing (vla-get-name blo) (car n));add DWGPROPS key with current RSA roof name and the number of modules on that roof
			)
		      	(princ)
		    );end if
		  );end if
		  (setq keycount (1+ keycount));move on to the next key in DWGPROPS
		 );end while
		);end foreach

		;;;;;;;;;;;;;;end make RSA roof variables in DWGPROPS;;;;;;;;;;;;;;;;
		
		;;;;;;;;;;;;;;;;;check roof modules;;;;;;;;;;;;
		
	    	(setq   keyname1 (strcat (vla-get-name blo) "S");RSA roof name and "S"
			keycount1 0
			keyvalue1 nil
			roofbinary 0
		)
		  (while;this checks whether the RSA roof name is in dwgprops or not and either adds it or if it already is in there, removes it and adds a new version if it is
		    (and	
		      (< keycount1 (vla-numcustominfo drawing));go through the whole DWGPROPS until the last key
		      (= roofbinary 0);the roof binary variable is not equal to 0
		    )
		      (vla-getcustombyindex;get current numbered index from DWGPROPS
		      	drawing
		      	keycount1
		      	'tempkeyname1
		      	'tempkeyvalue1
		      )  
		     (if
		      (= (+ keycount1 1) (vla-numcustominfo drawing));if this is the last key
		    	(if
		    		(= "S" (substr tempkeyname1 (- (strlen tempkeyname1) 0)));if the current key is a Salesforce roof
					(if
					  (= tempkeyname1 (strcat (vla-get-name blo) "S"));if the current DWGPROPS key is equal to the current Roof variable
					     (progn;execute
							(vla-getcustombykey drawing (strcat (vla-get-name blo) "S") 'roofmodsS);get number of modules of Salesforce roof in DWGPROPS
		      					(vla-getcustombykey drawing (vla-get-name blo) 'roofmods);get number of modules of RSA Roof in DWGPROPS
		      				(if
		      					(= roofmods roofmodsS);if number of modules on Salesforce roof is the same as number of modules on RSA roof
					  			(progn;execute
			 						(princ " Correct # of modules)) ")
							  		(setq roofbinary 1);end the while loop
								)
						  		;if number of modules on Salesforce roof is not the same as number of modules on RSA roof
					  			(progn;execute
								  (if (> (- (atoi roofmodsS) (atoi roofmods)) 0);if you subtract the number of modules on Salesforce roof from RSA roof and it's greater than 0
								    (progn
								    	(alert (strcat (vla-get-name blo) " missing " (itoa (- (atoi roofmodsS) (atoi roofmods))) " modules."));create a pop-up saying how many modules you are missing
								        (princ (strcat (vla-get-name blo) " missing " (itoa (- (atoi roofmodsS) (atoi roofmods))) " modules)) "))
								    )
								    ;if you subtract the number of modules on Salesforce roof from RSA roof and it's less than 0
								    (progn
								    	(alert (strcat (vla-get-name blo) " has "  (itoa (abs(- (atoi roofmodsS) (atoi roofmods)))) " modules that need to be removed."));create a pop-up saying how many modules you need to remove
								        (princ (strcat (vla-get-name blo) " has "  (itoa (abs(- (atoi roofmodsS) (atoi roofmods)))) " modules that need to be removed)) "))
								    )
			 					  )
							  		(setq roofbinary 1);end the while loop
								)
		    				);end if
				      	     )
					  ;if the current DWGPROPS key is not equal to the current Roof variable
					  (progn
					    	(alert (strcat "Missing System Builder " (vla-get-name blo) "\n" "or Layout " (vla-get-name blo) " needs to be removed."));create a popup saying that a Salesforce roof is missing
					    	(princ "Missing System Builder roof)) ")
					  	(setq roofbinary 1);end the while loop
					  )
				       );end if
			  ;if the current key is not a Salesforce roof
			  (progn
		    		(alert (strcat "Missing Salesforce " (vla-get-name blo) "\n" "or RSA " (vla-get-name blo) " needs to be removed."));create a popup saying that a Salesforce roof is missing
			    	(princ "Missing Salesforce roof)) ")
				(setq roofbinary 1);end the while loop
			  )
		  	);end if
		    (if;if this is not the last key
		      
		      	(= "S" (substr tempkeyname1 (- (strlen tempkeyname1) 0)));if the current key is a Salesforce roof
				(if
				  (= tempkeyname1 (strcat (vla-get-name blo) "S"));if the current DWGPROPS key is equal to the current Roof variable
		      			(progn
						(vla-getcustombykey drawing (strcat (vla-get-name blo) "S") 'roofmodsS);get number of modules of Salesforce roof in DWGPROPS
		      				(vla-getcustombykey drawing (vla-get-name blo) 'roofmods);get number of modules of RSA Roof in DWGPROPS
		      				(if
		      					(= roofmods roofmodsS);if number of modules on Salesforce roof is the same as number of modules on RSA roof
				  			(progn
			 					(princ "Correct # of modules)) ")
					  			(setq roofbinary 1);move on to the next roof
							)
				  			(progn
			 					(if (> (- (atoi roofmodsS) (atoi roofmods)) 0);if you subtract the number of modules on Salesforce roof from RSA roof and it's greater than 0
								  (progn
								    (alert (strcat (vla-get-name blo) " missing " (itoa (- (atoi roofmodsS) (atoi roofmods))) " modules."));create a pop-up saying how many modules you are missing
								    (princ (strcat (vla-get-name blo) " missing " (itoa (- (atoi roofmodsS) (atoi roofmods))) " modules)) "))
								  )
								  (progn
								    (alert (strcat (vla-get-name blo) " has "  (itoa (abs(- (atoi roofmodsS) (atoi roofmods)))) " modules that need to be removed."));create a pop-up saying how many modules you need to remove
								    (princ (strcat (vla-get-name blo) " has "  (itoa (abs(- (atoi roofmodsS) (atoi roofmods)))) " modules that need to be removed)) "))
								  )
			 					)
					  			(setq roofbinary 1);move on to the next roof
							)
		    				)
					)
				);end if
		      		(princ)
		    );end if
		  );end if
		  (setq keycount1 (1+ keycount1));move on to the next key in DWGPROPS
		 );end while

		;;;;;;;;;;;;;;;;;;;;;;;;;end check roof modules;;;;;;;;;;;;;;;;;;;
		(princ)
	      )
	      (progn
		(load "quickblock.lsp" "lisp failed to load")
	      	(alert (strcat (vla-get-name blo) " not found" "\n" "Please either select modules in " (vla-get-name blo) " or remove " (vla-get-name blo) "."))
		(initget 1 "Remove SelectArray")
		(setq ans (getkword "\nChoose [Remove/SelectArray]: "))
		(if (= ans "Remove")
		  (command "-purge" "Blocks" (vla-get-name blo) "No")
		  (progn
		  	(c:QuickB)
		  )
		)
	      )
	    )
	    )
	  
	  (princ)
      );end if
	  (princ)
    )
  )
  (princ)
 )
)
  