;-----------------------------------------------------------------------------;
;-----------------------------------------------------------------------------;
;------------COUNTS ALL ROOF MODULES, ROOF PITCHES AND ROOF-------------------;
;------------ORIENTATIONS AND COMPARES THE SYSYTEM BUILDER--------------------;
;------------ROOF TO THE LAYOUT ROOF------------------------------------------;
;-----------------------------------------------------------------------------;
;-----MADE BY TAMIR LIEBER----------------------------------------------------;
;-----------------------------------------------------------------------------;

(defun c:modcountr(/ blo doc js lst n tbl)
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
(setq orientationbinary 0)
	    	
		  (while;this checks whether the RSA roof name is in dwgprops or not and either adds it or if it already is in there, removes it and adds a new version if it is	
		      		(= orientationbinary 0);the orientation binary variable is not equal to 0
		   				(setq currentRSAOrientationNum (vl-catch-all-apply 'vlax-ldata-get (list "RSARoofOrientation" (strcat (vla-get-name blo) "O"))))
		    				(setq currentContractOrientationNum (vl-catch-all-apply 'vlax-ldata-get (list "currentRoofOrientation" (strcat (vla-get-name blo) "OS"))))
						(if
						  (and
			      				(= (vl-catch-all-apply 'numberp (list currentRSAOrientationNum)) T)
							(= (vl-catch-all-apply 'numberp (list (atoi currentContractOrientationNum))) T)
			  			  )
						  	(if (= currentRSAOrientationNum (atoi currentContractOrientationNum))
							   (progn;execute
			 					(princ (strcat " ((" (vla-get-name blo) " has correct orientation)) "))
							  	(setq orientationbinary 1);end the while loop
							   )
					  		   (progn;execute
								(alert (strcat (vla-get-name blo) " orientation is incorrect."));create a pop-up saying orientation is incorrect
							  	(setq orientationbinary 1);end the while loop
							   )
		    					);end if
						  (progn
						  	(alert (strcat "check " (vla-get-name blo) " orientation"))
						    	(setq orientationbinary 1);end the while loop
						   )
						);end if
		  			);end while
		

		;;;;;;;;;;;;;;;end check orientation;;;;;;;;;;;;;
		
		;;;;;;;;;;;;;;;;check roof pitch;;;;;;;;;;;;;;;

		(setq pitchbinary 0)
		  (while;this checks whether the RSA pitch name is in dwgprops or not and either adds it or if it already is in there, removes it and adds a new version if it is	
		      	(= pitchbinary 0);the pitch binary variable is not equal to 0
				(setq currentRSAPitchNum (vl-catch-all-apply 'vlax-ldata-get (list "RSARoofPitch" (strcat (vla-get-name blo) "P"))))
		    		(setq currentContractPitchNum (vl-catch-all-apply 'vlax-ldata-get (list "currentRoofPitch" (strcat (vla-get-name blo) "PS"))))
				(if
					(and
			      			(= (vl-catch-all-apply 'numberp (list currentRSAPitchNum)) T)
						(= (vl-catch-all-apply 'numberp (list (atoi currentContractPitchNum))) T)
			  		)
						(if (= currentRSAPitchNum (atoi currentContractPitchNum))
							   (progn;execute
			 					(princ (strcat " ((" (vla-get-name blo) " has correct pitch)) "))
							  	(setq pitchbinary 1);end the while loop
							   )
					  		   (progn;execute
								(alert (strcat (vla-get-name blo) " pitch is incorrect."));create a pop-up saying orientation is incorrect
							  	(setq pitchbinary 1);end the while loop
							   )
		    				);end if
				  		(progn
						  	(alert (strcat "check " (vla-get-name blo) " pitch"))
						    	(setq pitchbinary 1);end the while loop
						)
				);end if		
		 );end while
		
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
	    	
	    	(foreach n (vl-sort lst '(lambda (a b) (< (cdr a) (cdr b))))
		  	(vlax-ldata-put "RSARoofModules" (vla-get-name blo) (car n))
		);end foreach

		;;;;;;;;;;;;;;end make RSA roof variables in DWGPROPS;;;;;;;;;;;;;;;;
		
		;;;;;;;;;;;;;;;;;check roof modules;;;;;;;;;;;;
		
	    	(setq roofbinary 0)
		  (while;this checks whether the RSA roof name is in dwgprops or not and either adds it or if it already is in there, removes it and adds a new version if it is	
		      (= roofbinary 0);the roof binary variable is not equal to 0  
		     (setq currentRSAModuleNum (vl-catch-all-apply 'vlax-ldata-get (list "RSARoofModules" (vla-get-name blo))))
		     (setq currentContractModuleNum (vl-catch-all-apply 'vlax-ldata-get (list "currentRoofModules" (strcat (vla-get-name blo) "S"))))
				(if
					(and
			      			(= (vl-catch-all-apply 'numberp (list (atoi currentRSAModuleNum))) T)
						(= (vl-catch-all-apply 'numberp (list (atoi currentContractModuleNum))) T)
			  		)
						(if (= (atoi currentRSAModuleNum) (atoi currentContractModuleNum))
							   (progn;execute
			 					(princ (strcat " ((" (vla-get-name blo) " has correct number of modules)) "))
							  	(setq roofbinary 1);end the while loop
							   )
					  		   (if (> (- (atoi currentContractModuleNum) (atoi currentRSAModuleNum)) 0)
							     	(progn
								    (alert (strcat (vla-get-name blo) " missing " (itoa (- (atoi currentContractModuleNum) (atoi currentRSAModuleNum))) " modules."));create a pop-up saying how many modules you are missing
								    (princ (strcat (vla-get-name blo) " missing " (itoa (- (atoi currentContractModuleNum) (atoi currentRSAModuleNum))) " modules)) "))
								    (setq roofbinary 1)
								)
							     	(progn
								    (alert (strcat (vla-get-name blo) " has "  (itoa (abs(- (atoi currentContractModuleNum) (atoi currentRSAModuleNum)))) " modules that need to be removed."));create a pop-up saying how many modules you need to remove
								    (princ (strcat (vla-get-name blo) " has "  (itoa (abs(- (atoi currentContractModuleNum) (atoi currentRSAModuleNum)))) " modules that need to be removed)) "))
								    (setq roofbinary 1)
								)
							    );end if
		    				);end if
				  		(progn
						  	(alert (strcat "check " (vla-get-name blo) " Excel or Genesis"))
						    	(setq roofbinary 1);end the while loop
						)	
				);end if		
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
		  	(c:QuickBnew)
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