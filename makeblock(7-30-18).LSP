
(vl-load-com)
(defun c:QB (/ selectionset InsertionPoint Blockname)
  ;;; Tharwat 11. May. 2012 ;;
  (setq drawing (vla-get-summaryinfo (vla-get-activedocument (vlax-get-acad-object))))
  (vla-getcustombykey drawing "currRoof" 'thing);get the variable currRoof in dwgprops
  (vla-getcustombykey drawing "currpitch" 'Pitch)
  (vla-getcustombykey drawing "currorientation" 'Orientation)
  (setq number thing);number is now the value of j
  (setq pitchnum (fix (+ (atof Pitch) 0.5)))
  (setq orientationnum (fix (+ (atof Orientation) 0.5)))
      (if;if there are either genesis_module blocks or micro_module blocks and the insertion point is 0,0,0
	(and
		(or
		    (setq selectionset (ssget "x" (list (cons 0 "insert")(cons 2 "genesis_module"))))
		    (setq selectionset (ssget "x" (list (cons 0 "insert")(cons 2 "micro_module"))))
		)
       		(setq InsertionPoint (list 0 0 0))
     	)
	(progn;the blockname is "Roof" plus the current roof number
		(setq 
           	 	Blockname (strcat "Roof" number)
        	)
	  	
	  	(command "_.-Block" Blockname InsertionPoint selectionset "");make the block with the block name
	  	
		(command "_.-insert" Blockname InsertionPoint "" "" "");insert that block where it was
	  	
	)
	(PRINC)
      )
  		(setq RF (ssget "x" (list (cons 8 "N - ROOF NUMBERS"))))
	  	(command "draworder" RF "" "_FRONT")
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;BRING IN PITCH TO DWGPROPS;;;;;;;;;;;;;;;;;;;;;;;
  
  	(setq keyname (strcat Blockname "P");current RSA pitch
	      keycount 0
	      keyvalue nil
	)
  		(while;this checks whether the RSA pitch name is in dwgprops or not and either adds it or if it already is in there, removes it and adds a new version if it is
		    
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
		    		(= tempkeyname keyname);if the current DWGPROPS key has the same name as the current RSA pitch
		    			(progn;execute
	  					(vla-removecustombykey drawing keyname);remove DWGPROPS key with current RSA pitch name
			  			(vla-addcustominfo drawing keyname (itoa pitchnum) );add DWGPROPS key with current RSA pitch name and the pitch on that roof
					)
			  		;if the current DWGPROPS key has a different name as the current RSA roof block
		    			(vla-addcustominfo drawing keyname (itoa pitchnum));add DWGPROPS key with current RSA roof name and the number of modules on that roof
		  	);end if
		    (if;if this isn't the last key
		      	(= tempkeyname keyname);if the current DWGPROPS key has the same name as the current RSA pitch
		      	(progn;exeggutor
	  				(vla-removecustombykey drawing keyname);remove DWGPROPS key with current RSA pitch name
			  		(vla-addcustominfo drawing keyname (itoa pitchnum));add DWGPROPS key with current RSA pitch name and the pitch number on that roof
			)
		      	(princ)
		    );end if
		  );end if
		  (setq keycount (1+ keycount));move on to the next key in DWGPROPS
		 );end while|;
  
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;END PITCH TO DWGPROPS;;;;;;;;;;;;

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ORIENTATION TO DWGPROPS;;;;;;;;;;;;;;;;;;;;;;;
  	(setq keyname1 (strcat Blockname "O");current RSA roof orientation
	      keycount1 0
	      keyvalue1 nil
	)
  		(while;this checks whether the RSA roof name is in dwgprops or not and either adds it or if it already is in there, removes it and adds a new version if it is
		    
		      (< keycount1 (vla-numcustominfo drawing));go through the whole DWGPROPS until the last key
		    
		      (vla-getcustombyindex;get current numbered index from DWGPROPS
		      	drawing
		      	keycount1
		      	'tempkeyname1
		      	'tempkeyvalue1
		      )
		    
		  (if
		 
		     (= (+ keycount1 1) (vla-numcustominfo drawing));if this is the last key
			
		    
		    	(if
		    		(= tempkeyname1 keyname1);if the current DWGPROPS key has the same name as the current RSA pitch
		    			(progn;execute
	  					(vla-removecustombykey drawing keyname1);remove DWGPROPS key with current RSA pitch name
			  			(vla-addcustominfo drawing keyname1 (itoa orientationnum) );add DWGPROPS key with current RSA pitch name and the pitch on that roof
					)
			  		;if the current DWGPROPS key has a different name as the current RSA roof block
		    			(vla-addcustominfo drawing keyname1 (itoa orientationnum));add DWGPROPS key with current RSA roof name and the number of modules on that roof
		  	);end if
		    (if;if this isn't the last key
		      	(= tempkeyname1 keyname1);if the current DWGPROPS key has the same name as the current RSA roof orientation
		      	(progn;exeggutor
	  				(vla-removecustombykey drawing keyname1);remove DWGPROPS key with current RSA roof name
			  		(vla-addcustominfo drawing keyname1 (itoa orientationnum));add DWGPROPS key with current RSA roof name and the number of modules on that roof
			)
		      	(princ)
		    );end if
		  );end if
		  (setq keycount1 (1+ keycount1));move on to the next key in DWGPROPS
		 );end while|;
)