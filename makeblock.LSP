
(vl-load-com)
(defun c:QB (/ selectionset InsertionPoint Blockname)
  ;;; Tharwat 11. May. 2012 ;;
  (setq drawing (vla-get-summaryinfo (vla-get-activedocument (vlax-get-acad-object))))
  (vla-getcustombykey drawing "currRoof" 'thing);get the variable currRoof in dwgprops
  (vla-getcustombykey drawing "currpitch" 'Pitch)
  (vla-getcustombykey drawing "currorientation" 'Orientation)
  (setq number thing);number is now the value of j
  (setq Pitchnum (fix (+ (atof Pitch) 0.5)))
  (setq Orientationnum (fix (+ (atof Orientation) 0.5)))
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
  

;;;;;;;;;;;;;;;;set RSA pitch and orientation;;;;;;;;;;;;;;;
  	(setq pitchName (strcat Blockname "P");current RSA pitch
	      orientationName (strcat Blockname "O")
	)
		(vlax-ldata-put "RSARoofPitch" pitchName Pitchnum)
  		(vlax-ldata-put "RSARoofOrientation" orientationName Orientationnum)


  
)