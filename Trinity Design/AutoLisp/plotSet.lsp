;(load "log")
;(command ".undefine" "publish")
;(defun c:publish()
;	(logThis "publish")
;	(command ".publish")
;)
(vl-load-com)
(defun C:plotset( / )
  (setvar "tilemode" 1)
  (command "zoom" "extents" "")
	(COMMAND "UPDATEAPPSNOW")
;	(logThis "plotset")
  (setq drawing (vla-get-summaryinfo (vla-get-activedocument (vlax-get-acad-object))))
  (defun mkdwgprop(key value / result)
    (vla-addcustominfo drawing key value))
  
	(defun startProc()
		(setq currentTab (getvar "ctab"))
		(setq currentEcho (getvar "cmdecho"))
		(setvar "cmdecho" 0)
		(setvar "ctab" "Model")
	)

	(defun endProc()
		(setvar "ctab" currentTab)
		(setvar "cmdecho" currentEcho)
	)

	(defun counted(blkname / blockset)
		(command "zoom" "extents")
		(PROGN
			(SETQ BLOCKSET (SSGET "wp" '((2229.07 23025.7 0.0)(-13430.8 23025.7 0.0)(-13430.8 13447.6 0.0)(3901.35 13447.6 0.0)(3901.35 15535.8 0.0)(2229.07 15535.8 0.0))(LIST(CONS 2 blkname))))
			(IF
				(= BLOCKSET NIL)
				(SETQ TOTAL1 0)
				(SETQ TOTAL1(SSLENGTH BLOCKSET))
			)
		)
		(PROGN
			(SETQ BLOCKSET (SSGET "a" (LIST(CONS 2 blkname))))
			(IF
				(= BLOCKSET NIL)
				(SETQ TOTAL2 0)
				(SETQ TOTAL2(SSLENGTH BLOCKSET))
			)
		)
		(setq total (- total2 total1))
		(princ total)
)
	(defun totalAllBlocks()
		(setq 
			count1 (counted "A$C6EF85B4C")
			count2 (counted "A$C20456FC4")
			count3 (counted "60 CELL MODULE SINGLE")
			count4 (counted "panel")
			count5 (counted "panelLand")
			count6 (counted "Standard_Standard_260")
			count7 (counted "genesis_module")
			count8 (counted "micro_module")
		)
		(princ (+ count1 count2 count3 count4 count5 count6 count7 count8))
	)


		(setq modules
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"B12"
			)
		)
  			
	
	(startProc)
;;;	(setq 
;;;		total (totalAllBlocks)
;;;		modules 
;;;			(getcellsfunction  
;;;				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
;;;				"CALCULATIONS" 
;;;				"B12"
;;;			)
;;;	)
;	(command "redefine" "publish")
  (command "_Tilemode" 1);change to modelspace
  (vl-catch-all-apply 'mkdwgprop (list "mainDisconnect" "0"))
    	(command "zoom" "extents" "")
(if (setq s (ssget "_W" '(6270.1875 17484) '(6952.0625 16894.625) '((0 . "INSERT") (2 . "`*U*,SOLARMAINDISCONNECT_DYN"))));LOOK AT THE 3LINE WINDOW
  (progn
		(repeat (setq i (sslength s))
			(if  (= "SOLARMAINDISCONNECT_DYN"  (strcase  (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))));CHECK TO SEE THE UNFUSED DISCONNECT BLOCK
			  (progn
				(if (or
				      (= (LM:getvisibilitystate g ) "Fused")
				      (= (LM:getvisibilitystate g ) "No Disconnect")
				    )
				  (vla-setcustombykey drawing "mainDisconnect" "Fused PV Disconnect")
				)
			  )
			)
		)
  )
)
(if (setq s (ssget "_W" '(6270.1875 17484) '(6952.0625 16894.625) '((0 . "INSERT") (2 . "`*U*,SOLARMAINDISCONNECT_DYN"))));LOOK AT THE 3LINE WINDOW
  (progn
		(repeat (setq i (sslength s))
			(if  (= "SOLARMAINDISCONNECT_DYN"  (strcase  (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))));CHECK TO SEE THE UNFUSED DISCONNECT BLOCK
			  (progn
				(if 
				      (= (LM:getvisibilitystate g ) "Breaker")
				      
				    
				  (vla-setcustombykey drawing "mainDisconnect" "Breaker Enclosure")
				)
			  )
			)
		)
  )
)
(command "zoom" "previous" "")
(command "regen" "")
  
	(if
		(/= (modcountr) modules)
	  	(progn
			(alert "Depicted Panels NOT EQUAL to Excel File")
		  	(quit)
		)
		(command "publish")
	)
;	(command ".undefine" "publish")
;	(defun c:publish()
;		(logThis "publish")
;		(command ".publish")
;	)
	(endProc)
	(princ)
;(c:updateapps)
  )
(defun LM:getvisibilitystate ( blk )
    (LM:getdynpropvalue blk "Visibility1")
)
(defun LM:getdynpropvalue ( blk prp )
    (setq prp (strcase prp))
    (vl-some '(lambda ( x ) (if (= prp (strcase (vla-get-propertyname x))) (vlax-get x 'value)))
        (vlax-invoke blk 'getdynamicblockproperties)
    )
)
(defun modcountr(/ blo doc js lst n tbl)
  (setq total_modules 0)
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

		
		
		
				(foreach n (vl-sort lst '(lambda (a b) (< (cdr a) (cdr b))));gets the amount of modules in the current block
				  
			 			(setq total_modules (+ total_modules (atoi (car n))));number of modules
				  
	  			);end foreach
			);end strcat
		       
		);end princ
	    )
	  )
	)
	)
    )
  	total_modules
  )