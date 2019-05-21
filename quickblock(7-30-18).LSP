;-----------------------------------------------------------------------------;
;-----------------------------------------------------------------------------;
;-------------CREATES A NEW BLOCK AND ASKS USER TO NAME IT--------------------;
;-------------PLACES THE BLOCK AT (0,0,0)-------------------------------------;
;-----------------------------------------------------------------------------;
;-----------------------------------------------------------------------------;
;-----MADE BY TAMIR LIEBER----------------------------------------------------;
;-----------------------------------------------------------------------------;
(defun c:QuickB (/ selectionset insertionpoint number Blockname BLOCKSET blknm)
  ;;; Tharwat 11. May. 2012 ;;
  (setq numlist '("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14" "15" "16" "17" "18" "19" "20"
		  "21" "22" "23" "24" "25" "26" "27" "28" "29" "30" "31" "32" "33" "34" "35" "36" "37" "38" "39" "40"))
  (if (and (setq selectionset (ssget "_:L"))
           (setq insertionpoint (list 0 0 0))
      )
    (progn
      (setq 
            Blockname (strcat "Roof" (getstring "Input the roof number and press 'Enter': "));choose which roof you are making
      )
      (if
	  (setq rfblk (ssget "x" (list (cons 0 "insert")(cons 2 Blockname))));check to see if there is a duplicate block in the drawing
	    (progn
	      (command "zoom" "extents" "");zoom out
	      (foreach n numlist
		(setq blknm (strcat "Roof" n))
		;(alert blknm)
	      	(if (SETQ BLOCKSET (SSGET "_WP" '((2229.07 23025.7 0.0)(-13430.8 23025.7 0.0)(-13430.8 13447.6 0.0)(3901.35 13447.6 0.0)(3901.35 15535.8 0.0)(2229.07 15535.8 0.0)) (LIST(CONS 2 blknm))));check to see if 
		  (command "explode" BLOCKSET "");explode all block with roof numbers
		  (if (= blknm Blockname);otherwise the blocks are not in the grey box and need to be moved there
		    (progn
		  	(alert "Duplicates found\nPlease move to grey box");alert saying you need to move your layout to the grey box
		    	(quit)
		    )
		  )
		)
	      )
	        
	      	(command "-purge" "Blocks" Blockname "No");purge roof number
      		(command "_.-Block" Blockname insertionpoint selectionset "");make the new block with the name as the roof number
      		(command "_.-insert" Blockname insertionpoint "" "" "");insert the block in the place where it was made
	        (setq RF (ssget "x" (list (cons 8 "E - MODULE"))))
	  	(command "draworder" RF "" "_BACK")
	      
	        (command "zoom" "previous" "");zoom back
	    )
	    (progn
	        (command "-purge" "Blocks" Blockname "No");purge roof number
      		(command "_.-Block" Blockname insertionpoint selectionset "");make the new block with the name as the roof number
      		(command "_.-insert" Blockname insertionpoint "" "" "");insert the block in the place where it was made
	        (setq RF (ssget "x" (list (cons 8 "E - MODULE"))))
	  	(command "draworder" RF "" "_BACK")
	    )
      )
    (princ)
  )
  (princ)
)
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
	)
	(if
	  (= Blockname (vla-get-name blo))
	  (progn
  (setq drawing (vla-get-summaryinfo (vla-get-activedocument (vlax-get-acad-object))))
  (setq   keyname (vla-get-name blo);current roof block
	  keycount 0
	  keyvalue nil
  )
  (foreach n (vl-sort lst '(lambda (a b) (< (cdr a) (cdr b))))
		  
		  (while;this checks whether the  roof number is in dwgprops or not and either adds it or if it already is in there, removes it and adds a new version if it is
		    
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
		)
  )
	  (princ)
	  )
	)
	)
    )
  
	(c:modcount)
  )
    
  